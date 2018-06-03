# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'semantic'
  # before_action :configure_sign_in_params, only: [:create]
  #
  def pre_otp
    user = User.find_by pre_otp_params
    @two_factor_enabled = user && user.otp_required_for_login

    respond_to do |format|
      format.js
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:otp_attempt])
  end

  def pre_otp_params
    params.require(:user).permit(:email)
  end
end
