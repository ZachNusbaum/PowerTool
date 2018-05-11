# == Schema Information
#
# Table name: document_deliveries
#
#  created_at      :datetime         not null
#  description     :text
#  expires_at      :datetime
#  id              :bigint(8)        not null, primary key
#  recipient_email :string
#  token           :string
#  updated_at      :datetime         not null
#  user_id         :bigint(8)
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

class Document::Delivery < ApplicationRecord
  belongs_to :user
  has_secure_token
  has_one_attached :file
end
