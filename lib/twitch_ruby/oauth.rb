require 'oauth2'


module Twitch
  class OAuth

    #def initialize(client_id, client_secret, options = {})
    def initialize(options = {})
      opts = options.dup
      @oauth_options = {
        :site             => 'https://api.twitch.tv',
        :authorize_url    => '/kraken/oauth2/authorize',
        :token_url        => '/kraken/oauth2/token',
        :connection_opts  => {}}.merge(opts)

      @client = OAuth2::Client.new(Twitch.configuration.client_id, Twitch.configuration.client_secret, @oauth_options)
    end

    def get_access_token_info(code, options)
      opts = options.dup
      options = {
        :redirect_uri => 'http://localhost:3000/'
      }.merge(opts)

      result = @client.auth_code.get_token(code, options)
      Twitch.logger.debug(result.inspect)

      {
        'access_token' => result.token,
        'refresh_token' => result.refresh_token,
        'expires_in' => result.expires_in,
        'expires_at' => result.expires_at,
        'scopes' => result.params['scope'],
        'token_type' => 'bearer'
      }
    end

    def refresh(refresh_token)
      token = OAuth2::AccessToken.from_hash(@client, {
        refresh_token: URI.escape(refresh_token)
      })
      result = token.refresh!
      {
        'access_token' => result.token,
        'refresh_token' => result.refresh_token
      }
    end
  end
end
