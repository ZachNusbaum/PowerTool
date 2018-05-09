module Addresses
  class Verify
    def self.run(street, lastline, candidates = 10)
      lookup = SmartyStreets::USStreet::Lookup.new
      lookup.street = street
      lookup.lastline = lastline
      lookup.candidates = candidates
      client.send_lookup(lookup)

      lookup.result
    end

    def self.credentials
      auth_id = Rails.application.credentials.ss_auth_id
      auth_token = Rails.application.credentials.ss_auth_token
      SmartyStreets::StaticCredentials.new(auth_id, auth_token) 
    end

    def self.client
      SmartyStreets::ClientBuilder.new(credentials).build_us_street_api_client
    end
  end
end