# == Schema Information
#
# Table name: news_top_stories
#
#  author       :string
#  batch_token  :string
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
  belongs_to :source, class_name: 'News::Source', foreign_key: 'source_id',
    optional: true
  paginates_per 10

  def to_param
    self.token
  end

end
