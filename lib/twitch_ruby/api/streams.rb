require 'twitch_ruby/models/channel'
require 'twitch_ruby/representers/stream_representer'

module Twitch
  module API
    module Streams
      
      def stream
        url = "#{Twitch.configuration.twitch_base_url}/streams"
        
        stream = Twitch::Models::Stream.new
        stream.extend(Twitch::Representers::StreamRepresenter)
        stream.get(:uri => url, :access_token => self.access_token)
        stream
        
      end
      
      #
      # def streams(channel)
      #   url = "#{Twitch.configuration.twitch_base_url}/streams/#{channel}"
      #
      #   stream = Twitch::Models::Stream.new
      #   stream.extend(Twitch::Representers::StreamRepresenter)
      #   stream.get(:uri => url, :access_token => self.access_token)
      #   stream
      #
      # end
      
    end
  end
end