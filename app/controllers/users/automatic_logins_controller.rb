class Users::AutomaticLoginsController < ApplicationController
  rescue_from JWT::ExpiredSignature, with: :signature_expired
  def new
    decoded = Jwt::Decode.new(params[:jwt])
    @payload = decoded.result[0]
    @user = User.find_by_member_id(@payload['usr'])
    sign_in_and_redirect @user
  end

  private

  def signature_expired
    redirect_to root_path, notice: 'This link has expired.'
  end
end
