class GetTopStoriesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    News::PopulateTopStories.run!
  end
end
