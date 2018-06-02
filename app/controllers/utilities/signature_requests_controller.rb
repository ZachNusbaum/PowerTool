class Utilities::SignatureRequestsController < ApplicationController
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  def index
    @signatures = current_user.signatures
    authorize @signatures
  end

  def new
    @signature = Signature.new
    authorize @signature
  end

  def create
    @signature = Signature.new(new_signature_params)
    authorize @signature
    @signature.user = current_user
    if @signature.save
      SignaturesMailer.new_request(@signature).deliver_later!
      redirect_to utilities_signature_request_path(@signature), notice: 'Request sent.'
    else
      render :new
    end
  end

  def show
    @signature = Signature.find_by_uuid(params[:id])
    authorize @signature
    @submission = Signatures::Submit.new
  end

  def submit
    @signature = Signature.find_by_uuid(params[:signature_request_id])
    authorize @signature
    @submission = Signatures::Submit.run(submit_signature_params)
    if @submission.valid?
      ahoy.track 'Signature submitted', uuid: @signature.uuid
      redirect_to utilities_signature_request_path(@signature.uuid),
        notice: 'Success!'
    else
      render :show
    end
  end

  private

  def new_signature_params
    params.require(:signature).permit(:recipient_email, :description)
  end

  def submit_signature_params
    params.require(:signatures_submit).permit(:raw_data, :signer_name, :signer_title).merge(signature: @signature, signer: current_user)
  end

  def not_authorized
    redirect_to utilities_signature_requests_path, alert: 'Not authorized.'
  end
end
