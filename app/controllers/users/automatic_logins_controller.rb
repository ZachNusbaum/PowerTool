class Users::AutomaticLoginsController < ApplicationController
  def new
    decoded = Jwt::Decode.new(params[:jwt])
    @payload = decoded.result[0]
    @user = User.find_by_member_id(@payload['usr'])
    sign_in_and_redirect @user
  end
end
