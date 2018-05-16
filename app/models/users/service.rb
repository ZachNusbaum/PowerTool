# == Schema Information
#
# Table name: users_services
#
#  access_token        :string
#  access_token_secret :string
#  auth                :jsonb
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

class Users::Service < ApplicationRecord
  belongs_to :user

  %w{ github }.each do |provider|
    scope provider, ->{ where(provider: provider) }
  end

  def client
    send("#{provider}_client")
  end

  def expired?
    expires_at? && expires_at <= Time.zone.now
  end

  def access_token
    send("#{provider}_refresh_token!", super) if expired?
  end
end
