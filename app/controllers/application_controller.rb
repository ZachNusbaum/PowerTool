class ApplicationController < ActionController::Base
  include Pundit
  layout 'semantic'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_raven_context

  def authenticate_admin_user!
    authenticate_user!
    redirect_to root_path, notice: 'Unauthorized access.' unless current_user.admin?
  end

  private

  def set_raven_context
    Raven.user_context(id: current_user.try(:id)) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
