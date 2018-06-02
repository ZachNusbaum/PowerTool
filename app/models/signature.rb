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
#  uuid            :uuid
#

class Signature < ApplicationRecord
  before_save :set_uuid
  belongs_to :user, foreign_key: 'signed_by', optional: true, class_name: 'User'
  def to_param
    self.uuid
  end

  private

  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end
end
