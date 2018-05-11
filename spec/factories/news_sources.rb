# == Schema Information
#
# Table name: news_sources
#
#  category    :string
#  country     :string
#  created_at  :datetime         not null
#  description :text
#  id          :bigint(8)        not null, primary key
#  language    :string
#  name        :string
#  source_id   :string
#  token       :string
#  updated_at  :datetime         not null
#  url         :string
#
# Indexes
#
#  index_news_sources_on_source_id  (source_id) UNIQUE
#  index_news_sources_on_token      (token) UNIQUE
#

FactoryBot.define do
  factory :news_source, class: 'News::Source' do
    source_id "MyString"
    name "MyString"
    description "MyText"
    url "MyString"
    category "MyString"
    language "MyString"
    country "MyString"
    token ""
  end
end
