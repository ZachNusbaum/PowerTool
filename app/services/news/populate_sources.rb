module News
  class PopulateSources < ActiveInteraction::Base
    def execute
      sources.each do |source|
        news_source = News::Source.find_or_initialize_by(source_id: source['id']) do |ns|
          ns.name = source['name']
          ns.description = source['description']
          ns.url = source['url']
          ns.category = source['category']
          ns.language = source['language']
          ns.country = source['country']
        end.save
      end
    end

    private

    def sources
      result.body['sources']
    end

    def result
      connection.get('sources') do |conn|
        conn.headers['X-Api-Key'] = Rails.application.credentials.news_api_key
      end
    end

    def connection
      Faraday.new 'https://newsapi.org/v2' do |conn|
        conn.response :json, :content_type => /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end
  end
end