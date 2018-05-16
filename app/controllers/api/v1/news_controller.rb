class Api::V1::NewsController < Api::BaseController
  def bookmarks
    render json: current_user.bookmarks
  end
end
