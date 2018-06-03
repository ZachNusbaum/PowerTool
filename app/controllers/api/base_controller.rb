class Api::BaseController < ActionController::API
  include Pundit
  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
  end
end
