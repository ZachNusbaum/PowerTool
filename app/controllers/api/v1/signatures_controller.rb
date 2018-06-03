class Api::V1::SignaturesController < Api::BaseController
  before_action -> { doorkeeper_authorize! :signature }

  def show
    @signature = Signature.find_by_uuid(params[:uuid])
    authorize @signature
    if @signature.present?
      render json: signature_hash
    else
      render json: { error: 'Message not found' }, status: 404
    end
  end

  def create
    @signature = Signature.new(signature_params)
    if @signature.save
      render json: signature_hash, status: :ok
    else
      render json: { error: 'Please try again' }, status: 400
    end
  end

  private
  def signature_hash
    {
        recipient: @signature.recipient_email,
        uuid: @signature.uuid,
        sender: @signature.user.try(:email),
        description: @signature.description,
        signed_at: @signature.signed_at,
        signed_by: @signature.signer.try(:email),
        url: utilities_signature_request_url(@signature.uuid)
    }
  end

  def signature_params
    params.require(:data).permit(:recipient_email, :description).merge(user: current_user)
  end
end