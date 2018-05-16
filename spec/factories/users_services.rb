# == Schema Information
#
# Table name: users_services
#
#  access_token        :string
#  access_token_secret :string
#  auth                :text
#  created_at          :datetime         not null
#  expires_at          :datetime
#  id                  :bigint(8)        not null, primary key
#  provider            :string
#  refresh_token       :string
#  uid                 :string
#  updated_at          :datetime         not null
#  user_id             :bigint(8)
#
# Indexes
#
#  index_users_services_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :users_service, class: 'Users::Service' do
    provider "MyString"
    uid "MyString"
    access_token "MyString"
    access_token_secret "MyString"
    refresh_token "MyString"
    expires_at "2018-05-15 21:19:39"
    auth "MyText"
  end
end
