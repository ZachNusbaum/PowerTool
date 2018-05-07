class News::PopulateTopStories < ActiveInteraction::Base
  def execute
    articles.each do |article|
      News::TopStory.find_or_initialize_by(published_at: Chronic.parse(article['publishedAt'])) do |story|
        story.source_id = article['source']['id']
        story.author = article['author']
        story.title = article['title']
        story.description = article['description']
        story.story_url = article['url']
        story.image_url = article['urlToImage']
        story.published_at = Chronic.parse(article['publishedAt'])
      end.save
    end
  end

  private

  def articles
    result.body['articles']
  end

  def result
    connection.get('5af06d403100002c0096c63a')
  end

  def connection
    Faraday.new 'http://www.mocky.io/v2' do |conn|
      conn.response :json, :content_type => /\bjson$/
      conn.adapter Faraday.default_adapter
    end
  end
end
