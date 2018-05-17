class Api::V1::NewsController < Api::BaseController
  before_action -> { doorkeeper_authorize! :read_all }
  def bookmarks
    render json: current_user.top_stories.select(:token, :source_id, :author, :description,
                                                :story_url, :published_at)
  end
end
