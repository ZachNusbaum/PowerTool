class Emails::IncomingController < ApplicationController
  def create
    puts params
    render json: { status: 'ok' }, status: :ok
  end
end
