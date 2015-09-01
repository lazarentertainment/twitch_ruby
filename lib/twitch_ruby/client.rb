require 'twitch_ruby/api'
require 'twitch_ruby/authenticator'
require "roar/http_verbs"

module Twitch

  class << self
    attr_accessor :instance
    
    def client(options = {})
      self.instance ||= Twitch.authenticate(options)
      self.instance
    end

    def authenticate(options = {})
      self.instance ||= Twitch::Client.new(options)
      unless self.instance.authenticated?
        self.instance.auth
      end
      self.instance
    end
  end


  class Client
    include Twitch::API

    attr_accessor :access_token, :authenticated
    
    # @return [Boolean]
    def authenticated?
      !!authenticated
    end
    
    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Twitch::Client]
    def initialize(options = {})
      Roar::HttpVerbs.transport_engine = Twitch::Transport
      unless options.empty?
        self.config_instance(options)
      end
      self
    end

    def config_instance(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def user_name
      @root.user_name
    end

    def scopes
      @root.scopes
    end

    def auth
      @root = self.root
      if @root.valid
        @authenticated = @root.valid
      end
      self
    end
    
    
  end
  
  
end