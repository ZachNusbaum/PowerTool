Koala.configure do |config|
 config.app_id = Rails.application.credentials.facebook_key
 config.app_secret = Rails.application.credentials.facebook_secret
# See Koala::Configuration for more options, including details on how to send requests through
# your own proxy servers.
end
