require 'open-uri'

module TW
  class User < OpenStruct
    def self.find identifier
      user_info = fetch_requester_info(identifier)
      { name: user_info['name'], email: user_info["email"], ad_id: user_info["username"] }
    end

    private
    def self.call_api(identifier)
      requester_configs = TW_CONFIG
      requester_details_api = requester_configs['base_api'] + identifier
      open(requester_details_api, http_basic_authentication: [requester_configs['user_id'],requester_configs['password']]).read
    end

    def self.fetch_requester_info(identifier)
      response = call_api(identifier)
      response ? JSON.parse(response[response.index('{')..response.length]) : nil
    end
  end
end