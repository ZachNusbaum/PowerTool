class Users::TwoFactorController < ApplicationController
  before_action :authenticate_user!
  before_action :generate_otp_code
  def show
    @user = current_user
    @qr_code = RQRCode::QRCode.new(@user.otp_provisioning_uri("PowerTool:#{@user.email}", issuer: 'ZDN Enterprises'),
      size: 15)
  end

  def enable
    if current_user.valid_otp?(enable_params[:otp_attempt])
      current_user.update(otp_required_for_login: true)
      # @codes = current_user.generate_otp_backup_codes!
      redirect_to users_two_factor_path, notice: 'Two-Factor enabled!'
    else
      redirect_to users_two_factor_path, notice: 'Sorry, please try again.'
    end
  end

  private

  def generate_otp_code
    unless !current_user.otp_secret.blank?
      current_user.update(otp_secret: User.generate_otp_secret)
    end
  end

  def enable_params
    params.require(:enable_otp).permit(:otp_attempt)
  end
end
