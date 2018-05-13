class News::SourcesController < ApplicationController
  def index
    @sources = News::Source.all.page(params[:page])
  end

  def show
    @source = News::Source.includes(:stories).find_by_source_id(params[:id])
    @stories = @source.stories.page(params[:page])
  end
end
