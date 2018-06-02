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

class Signature < ApplicationRecord
  before_save :set_uuid

  belongs_to :signer, foreign_key: 'signed_by', optional: true, class_name: 'User'
  belongs_to :user

  attribute :sender_email, :string, default: nil

  validates :recipient_email, :description, presence: true

  def to_param
    self.uuid
  end

  private

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
