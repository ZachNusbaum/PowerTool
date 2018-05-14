class News::BookmarksController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookmarks = current_user.bookmarks.page params[:page]
    authorize @bookmarks
  end

  def create
    @story = News::TopStory.find_by_token(params[:id])
    @bookmark = current_user.bookmark_story(@story)

    respond_to do |format|
      format.js
    end
  end

  def destroy
    @bookmark = News::Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      redirect_to bookmarks_stories_path, notice: 'Bookmark removed.'
    else
      redirect_to bookmarks_stories_path, notice: 'Bookmark not removed.'
    end
  end
end
