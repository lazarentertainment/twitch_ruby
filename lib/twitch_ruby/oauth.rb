require 'oauth2'


module Twitch
  class OAuth

    def initialize(client_id, client_secret, options = {})
      @id = client_id
      @secret = client_secret

      opts = options.dup
      @oauth_options = {
        :site             => 'https://api.twitch.tv',
        :authorize_url    => '/kraken/oauth2/authorize',
        :token_url        => '/kraken/oauth2/token',
        :connection_opts  => {}}.merge(opts)

      @client = OAuth2::Client.new(client_id, client_secret, @oauth_options)
    end

    def get_access_token_info(code, options)
      opts = options.dup
      options = {
        :redirect_uri => 'http://localhost:3000/oauth/callback'
      }.merge(opts)

      token = @client.auth_code.get_token(code, options)
      {
        "access_token" => token.token,
        "token_type" => "bearer"
      }
    end
  end
end