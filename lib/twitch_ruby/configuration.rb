require 'securerandom'
require 'logging'

module Twitch
  
  class << self
    attr_accessor :configuration
  end
    
  # @private
  class Configuration

    def initialize
      @test_mode = false
      @twitch_base_url = 'https://api.twitch.tv/kraken'
      @oauth_token_uri = @twitch_base_url + '/oauth2/token'
      @oauth_authorize_uri =  @twitch_base_url + '/oauth2/authorize'
      @redirect_uri = 'http://localhost:3000/auth/twitch/callback'
      
      @logger = Logging.logger(STDOUT)
      @logger.level = :debug
      logger.info "Starting Twitch_Ruby gem"
    end

    attr_accessor :test_mode, :client_id, :client_secret, :twitch_base_url, :redirect_uri
    attr_accessor :oauth_token_uri, :oauth_authorize_uri
    attr_accessor :logger
    
  end
  
  # Configure global settings for interacting with TwitchRuby. 
  # @example
  #   Twitch.configure do |config|
  #     config.client_id = 'enteryourclientid'
  #     config.client_secret = 'enteryourclientsecret'
  #   end
  #
  #   streams = Twitch.streams.featured(:limit => 10)
  # @param client_id [String] When making requests to Twitch,
  #   you must specify a client ID for your application. 
  # @param client_secret [String] When making requests to Twitch,
  #   you must specify the client secret for your application. 
  # @return [nil] nil
  def self.configure
    self.configuration ||= Twitch::Configuration.new
    yield(configuration)
  end
  
  def self.logger
    self.configuration.logger
  end
  
end
