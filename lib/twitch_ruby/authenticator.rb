require 'faraday'
require 'json'
require 'twitch_ruby'
require 'twitch_ruby/models/credentials'

module Twitch
  class Authenticator

    def authenticate(options)
      #Twitch.logger.debug('*** Authenticator.authenticate')
      
      postBody = {
        :code => options[:authorization_code],
        :redirect_uri => Twitch.configuration.redirect_uri,
        :client_id => Twitch.configuration.client_id,
        :client_secret => Twitch.configuration.client_secret,
        :scope => '',
        :grant_type => 'authorization_code',
        :state => options[:state],
      } 
      
      #Twitch.logger.debug(postBody)
      
      response = build_connection(Twitch.configuration.oauth_token_uri).post(nil, postBody)

      if response.status == 200
        Twitch::Models::Credentials.new().
        extend(Twitch::Representers::CredentialsRepresenter).
        from_json(response.body)
      elsif response.status == 401
      elsif response.status == 403
        #{"error"=>"Forbidden", "status"=>403, "message"=>"Invalid client secret osa6e80lss3csxqu5w8iqafz2ecmuy8"}
      else
        
        Twitch.logger.warn(JSON.parse(response.body))
      end
    end

    private

      def build_connection(uri)
    
        Faraday.new(
          url: uri,
          request: {open_timeout: 5, timeout: 5},
          headers: default_headers
        ) do |faraday|
          faraday.request  :url_encoded
          faraday.adapter ::Faraday.default_adapter
        end
      end

      def default_headers
        headers = {
          'Content-Type' => 'application/x-www-form-urlencoded'
        }
        headers
      end
  end
end