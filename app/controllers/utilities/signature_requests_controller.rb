class Utilities::SignatureRequestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @signatures = current_user.signatures
  end

  def new
    @signature = Signature.new
  end

  def create
    @signature = Signature.new(new_signature_params)
    if @signature.save!
      redirect_to utilities_signature_request_path(@signature), notice: 'Request sent.'
    else
      render :new
    end
  end

  def show
    @signature = Signature.find_by_uuid(params[:id])
  end

  def submit
    @signature = Signature.find_by_uuid(params[:signature_request_id])
    if @signature.update(submit_signature_params)
      @signature.update(signed_at: DateTime.now, signed_by: current_user.id)
      redirect_to utilities_signature_request_path(@signature.uuid),
        notice: 'Success!'
    end
  end

  private

  def new_signature_params
    params.require(:signature).permit(:recipient_email, :description)
  end

  def submit_signature_params
    params.require(:signature).permit(:raw_data)
  end
end
