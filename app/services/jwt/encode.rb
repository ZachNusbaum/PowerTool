module Jwt
  class Encode < Jwt::Base
    attr_reader :result

    def initialize(payload)
      @payload = payload
      @result = encode
    end

    def encode
      @payload[:iat] = Time.zone.now.to_i
      @payload[:jti] = SecureRandom.uuid
      JWT.encode @payload, HMAC_SECRET, 'HS256'
    end
  end
end