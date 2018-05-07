# == Schema Information
#
# Table name: news_top_stories
#
#  author       :string
#  created_at   :datetime         not null
#  description  :text
#  id           :integer          not null, primary key
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

FactoryBot.define do
  factory :news_top_story, class: 'News::TopStory' do
    token ""
    source_id "MyString"
    author "MyString"
    title "MyString"
    description "MyText"
    story_url "MyString"
    image_url "MyString"
    published_at "2018-05-07 08:35:40"
  end
end
