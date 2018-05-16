class Api::V1::NewsController < Api::BaseController
  before_action -> { doorkeeper_authorize! :read_all }
  def bookmarks
    render json: current_user.bookmarks
  end
end
