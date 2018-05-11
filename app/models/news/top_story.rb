# == Schema Information
#
# Table name: news_top_stories
#
#  author       :string
#  created_at   :datetime         not null
#  description  :text
#  id           :bigint(8)        not null, primary key
#  image_url    :string
#  published_at :datetime
#  source_id    :string
#  story_url    :string
#  title        :string
#  token        :string
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_news_top_stories_on_token  (token) UNIQUE
#

class News::TopStory < ApplicationRecord
  has_secure_token

  def to_param
    self.token
  end

  def source
    return false if self.source_id.blank?
    News::Source.find_by_source_id(self.source_id)
  end
end
