class News::TopStoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @stories = News::TopStory.all.order(published_at: :desc)
  end

  def show
    @story = News::TopStory.find_by_token params[:id]
  end
end
