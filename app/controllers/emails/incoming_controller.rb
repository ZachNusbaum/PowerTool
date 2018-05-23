class Emails::IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    puts params
    render json: { status: 'ok' }, status: :ok
  end
end
