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

  %w{ github facebook }.each do |provider|
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
    super
  end

  def github_client
    Octokit::Client.new(access_token: access_token)
  end

  def facebook_client
    Koala::Facebook::API.new(access_token)
  end

  def spotify_client
    RSpotify::User.new(auth)
  end

  def google_oauth2_client
    client = Google::APIClient.new
    client.authorization.access_token = access_token
    client.authorization.refresh_token = refresh_token
    client.authorization.client_id = Rails.application.credentials.google_key
    client.authorization.client_secret = Rails.application.credentials.google_secret
    client.authorization.refresh!
    client
  end

  def facebook_refresh_token!(token)
    new_token_info = Koala::Facebook::OAuth.new.exchange_access_token_info(token)
    update(access_token: new_token_info["access_token"], expires_at: Time.zone.now + new_token_info["expires_in"])
  end
end
