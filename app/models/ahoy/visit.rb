# == Schema Information
#
# Table name: ahoy_visits
#
#  browser          :string
#  city             :string
#  country          :string
#  device_type      :string
#  id               :bigint(8)        not null, primary key
#  ip               :string
#  landing_page     :text
#  os               :string
#  referrer         :text
#  referring_domain :string
#  region           :string
#  search_keyword   :string
#  started_at       :datetime
#  user_agent       :text
#  user_id          :bigint(8)
#  utm_campaign     :string
#  utm_content      :string
#  utm_medium       :string
#  utm_source       :string
#  utm_term         :string
#  visit_token      :string
#  visitor_token    :string
#
# Indexes
#
#  index_ahoy_visits_on_user_id      (user_id)
#  index_ahoy_visits_on_visit_token  (visit_token) UNIQUE
#

class Ahoy::Visit < ApplicationRecord
  self.table_name = "ahoy_visits"

  has_many :events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true
end
