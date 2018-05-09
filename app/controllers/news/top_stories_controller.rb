class News::TopStoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @stories = News::TopStory.all.order(published_at: :desc)
  end

  def show
    @story = News::TopStory.find_by_token params[:id]
  end

  def email_opt_in_toggle
    current_user.update(send_daily_stories: !current_user.send_daily_stories)
    redirect_to news_top_stories_url
  end
end
