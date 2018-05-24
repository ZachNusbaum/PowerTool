# == Schema Information
#
# Table name: emails_dmarc_accounts
#
#  api_key    :string
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  title      :string
#  token      :string
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#
# Indexes
#
#  index_emails_dmarc_accounts_on_api_key  (api_key) UNIQUE
#  index_emails_dmarc_accounts_on_title    (title) UNIQUE
#  index_emails_dmarc_accounts_on_token    (token) UNIQUE
#  index_emails_dmarc_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Emails::DmarcAccount < ApplicationRecord
  belongs_to :user
  has_secure_token

  def client
    PostDmarc::Client.new(api_key)
  end

  def to_param
    token
  end
end
