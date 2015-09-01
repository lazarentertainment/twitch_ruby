require 'twitch_ruby/api'
require 'twitch_ruby/authenticator'
require "roar/http_verbs"

module Twitch

  class << self
    attr_accessor :instance
  end
  
  def self.client(options = {})
    self.instance ||= Twitch::Client.new
    unless options.empty?
      self.instance.config_instance(options)
    end
    self.instance
  end
  
  class Client
    include Twitch::API

    attr_accessor :authorization_code, :state, :access_token, :refresh_token #, :client_id, :client_secret
    attr_accessor :credentials
    
    # @return [Boolean]
    def authorization_code?
      !!authorization_code
    end
    
    # @return [Boolean]
    def credentials?
      !!credentials
    end
    
    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Twitch::Client]
    def initialize
      Roar::HttpVerbs.transport_engine = Twitch::Transport
      yield(self) if block_given?
    end

    def config_instance(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def auth
      
    end
    
    
  end
  
  
end