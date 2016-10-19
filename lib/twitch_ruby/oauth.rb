require 'oauth2'


module Twitch
  class OAuth

    def initialize(app_id, app_secret, options = {})
      @id = client_id
      @secret = client_secret

      opts = options.dup
      @oauth_options = {
        :site             => 'https://api.twitch.tv',
        :authorize_url    => '/kraken/oauth2/authorize',
        :token_url        => '/kraken/oauth2/token',
        :connection_opts  => {}}.merge(opts)

      @client = OAuth2::Client.new(app_id, app_secret, @oauth_options)
    end

    def get_access_token(code, options)
      opts = options.dup
      options = {
        :redirect_uri => 'http://localhost:3000/oauth/callback'
      }.merge(opts)

      token = @client.auth_code.get_token(code, options)
    end


    response = token.get('/api/resource', :params => { 'query_foo' => 'bar' })
    response.class.name
    # => OAuth2::Response


  end
end