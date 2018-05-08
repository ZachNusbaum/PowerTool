# == Schema Information
#
# Table name: news_sources
#
#  category    :string
#  country     :string
#  created_at  :datetime         not null
#  description :text
#  id          :integer          not null, primary key
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

class News::Source < ApplicationRecord
  has_secure_token
end
