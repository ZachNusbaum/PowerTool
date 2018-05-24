class Emails::IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    Emails::ParseIncomingMessage.run!(params: params.permit!.to_h)
    render json: { status: 'ok' }, status: :ok
  end

end
