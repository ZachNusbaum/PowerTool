# == Schema Information
#
# Table name: news_bookmarks
#
#  created_at   :datetime         not null
#  id           :bigint(8)        not null, primary key
#  top_story_id :bigint(8)
#  updated_at   :datetime         not null
#  user_id      :bigint(8)
#
# Indexes
#
#  index_news_bookmarks_on_top_story_id  (top_story_id)
#  index_news_bookmarks_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (top_story_id => news_top_stories.id)
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :news_bookmark, class: 'News::Bookmark' do
    user nil
    top_story nil
  end
end
