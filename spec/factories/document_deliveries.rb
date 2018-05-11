# == Schema Information
#
# Table name: document_deliveries
#
#  created_at  :datetime         not null
#  description :text
#  expires_at  :datetime
#  id          :bigint(8)        not null, primary key
#  token       :string
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#
# Indexes
#
#  index_document_deliveries_on_token    (token) UNIQUE
#  index_document_deliveries_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :document_delivery, class: 'Document::Delivery' do
    token ""
    description "MyText"
    expires_at "2018-05-11 14:31:53"
    user nil
  end
end
