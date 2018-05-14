class News::BookmarksController < ApplicationController
  def index
    @stories = current_user.top_stories
  end

  def create
    @story = News::TopStory.find_by_token(params[:id])
    @bookmark = current_user.bookmark_story(@story)

    respond_to do |format|
      format.js
    end
  end
end
