class Api::V1::NewsController < Api::BaseController
  before_action :doorkeeper_authorize!
  def bookmarks
    render json: current_user.bookmarks
  end
end
