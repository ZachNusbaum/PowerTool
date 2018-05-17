class Api::BaseController < ActionController::API
  def current_user
    @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
  end
end
