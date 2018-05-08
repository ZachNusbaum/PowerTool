class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    authenticate_user!
    redirect_to root_path, notice: 'Unauthorized access.' unless current_user.admin?
  end
end
