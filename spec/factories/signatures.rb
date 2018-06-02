# == Schema Information
#
# Table name: signatures
#
#  created_at      :datetime         not null
#  description     :text
#  id              :bigint(8)        not null, primary key
#  raw_data        :text
#  recipient_email :string
#  signed_at       :datetime
#  signed_by       :integer
#  updated_at      :datetime         not null
#  user_id         :bigint(8)
#  uuid            :uuid
#
# Indexes
#
#  index_signatures_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :signature do
    uuid ""
    recipient_email "MyString"
    raw_data ""
    signed_at "2018-05-30 16:54:42"
    description "MyText"
  end
end
