class News::PopulateTopStories < ActiveInteraction::Base
  def execute
    @batch_token = SecureRandom.uuid
    articles.each do |article|
      News::TopStory.find_or_initialize_by(published_at: Chronic.parse(article['publishedAt'])) do |story|
        story.source_id = article['source']['id']
        story.author = article['author']
        story.title = article['title']
        story.description = article['description']
        story.story_url = article['url']
        story.image_url = article['urlToImage']
        story.published_at = Chronic.parse(article['publishedAt'])
        story.batch_token = @batch_token
      end.save
    end
  end

  private

  def articles
    result.body['articles']
  end

  def result
    connection.get('top-headlines') do |req|
      req.headers['X-Api-Key'] = Rails.application.credentials.news_api_key
      req.params['country'] = 'us'
    end
  end

  def connection
    Faraday.new 'https://newsapi.org/v2' do |conn|
      conn.response :json, :content_type => /\bjson$/
      conn.adapter Faraday.default_adapter
    end
  end
end
