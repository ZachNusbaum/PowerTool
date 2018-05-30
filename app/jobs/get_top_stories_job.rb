class GetTopStoriesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    News::PopulateTopStories.run!
    clear_duplicates
  end

  def clear_duplicates
    duplicates = News::TopStory.select(:title, :story_url).group(:title, :story_url).having("count(*) > 1")
    duplicates.each do |duplicate|
      stories = News::TopStory.where(title: duplicate.title, story_url: duplicate.story_url)
      stories.first.destroy if (stories.count > 1)
    end
  end
end
