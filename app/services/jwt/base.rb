module Jwt
  class Base
    HMAC_SECRET = Rails.application.credentials.secret_key_base
  end
end