require 'faraday'
require 'json'

module TwitchRuby
  class Connection


    def self.connection=(val)
      @connection = val
    end

    def self.connection
      @connection ||= Faraday.new(some stuff to build up connection)
    end

    def initialize(client_id, base_url = DEFAULT_BASE_URL)
      raise ArgumentError, 'client_id' if !client_id || client_id.empty?
      raise ArgumentError, 'base_url' if !base_url || base_url.empty?
      
      @base_url = Addressable::URI.parse(base_url)
      
      @connection = Faraday.new(:url => @base_url) do |faraday|
        faraday.adapter Faraday.default_adapter 
        faraday.response :logger
        faraday.options.timeout = 5
        faraday.options.open_timeout = 3
      end


      @client_id = client_id
      
    end

    def get(path, query = nil)
      
      raise ArgumentError, 'path' if !path || path.empty?
      
      current_headers = {
        'Client-ID' => @client_id
      }.merge(headers())
      
      response = @connection.get do |request|
        request.url path
        request.headers = current_headers
        request.params = query
      end
      
      handle_response(response)
    end

    def post(path, body = nil)
      raise ArgumentError, 'path' if !path || path.empty?
      
      current_headers = {
        'Client-ID' => @client_id
      }.merge(headers())
      
      response = @connection.post do |request|
        request.url path
        request.headers = current_headers
        request.body = body
      end

      handle_response(response)
    end
    
    def put(path, body = nil)
      
      raise ArgumentError, 'path' if !path || path.empty?
      
      current_headers = {
        'Client-ID' => @client_id
      }.merge(headers())
      
      response = @connection.put do |request|
        request.url path
        request.headers = current_headers
        request.body = body
      end
      
      handle_response(response)
    end
    
    def delete(path)
      
      raise ArgumentError, 'path' if !path || path.empty?
      
      current_headers = {
        'Client-ID' => @client_id
      }.merge(headers())
      
      response = @connection.delete do |request|
        request.url path
        request.headers = current_headers
      end
      
      handle_response(response)
      
    end
    # :head, :patch, :options

    protected
    def default_headers(other_headers)
      headers = {
        'Content-Type' => 'application/json',
        'Accept' => 'application/vnd.twitchtv.v3+json',
        'Twitch-Ruby-Version' => TwitchRuby::VERSION
      }
      headers
    end
    
    def handle_response(response)

      status = response.status
      case status
        when 400...500
          raise Error::ClientError.new("HTTP client error, status #{status}.", url, status, body)
        when 500...600
          raise Error::ServerError.new("HTTP server error, status #{status}.", url, status, body)
        else
          # Ignore, assume success.
      end

      body = response.body

      begin
        return JSON.parse(body)
      rescue JSON::ParserError => e
        raise Error::FormatError.new(e, path, status, body)
      end
    end

    private
      DEFAULT_BASE_URL = 'https://api.twitch.tv/kraken/'
  end
end
