require 'faraday'
require 'json'

module Twitch
  class Transport


    def get_uri(options)
      build_connection(options[:uri], options[:client_id]).get
    end

    def post_uri(options)
      build_connection(options[:uri], options[:client_id]).post(nil, options[:body])
    end

    def put_uri(options)
      build_connection(options[:uri], options[:client_id]).put(nil, options[:body])
    end

    def patch_uri(options)
      build_connection(options[:uri], options[:client_id]).patch(nil, options[:body])
    end

    def delete_uri(options)
      build_connection(options[:uri], options[:client_id]).delete
    end

    private

      def build_connection(uri, client_id)
      
        current_headers = {
          'Client-ID' => client_id
        }.merge(default_headers)
      
        
        ::Faraday::Connection.new(
          :url => uri,
          :headers => current_headers
        ) do |builder|
          builder.use ::Faraday::Response::RaiseError
          builder.adapter ::Faraday.default_adapter
        end
      end
    
      def default_headers
        headers = {
          'Content-Type' => 'application/json',
          'Accept' => 'application/vnd.twitchtv.v3+json',
          'Twitch-Ruby-Version' => Twitch::VERSION
        }
        headers
      end
      
  end
end
