module Jwt
  class Decode < Jwt::Base
    attr_reader :result
    
    def initialize(jwt)
      @jwt = jwt
      @result = decode
    end

    def decode
      JWT.decode @jwt, HMAC_SECRET, true, { algorithm: 'HS256' }
    end
  end
end