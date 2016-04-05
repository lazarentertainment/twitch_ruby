require 'twitch_ruby/models/channel'
require 'twitch_ruby/representers/channel_representer'

module Twitch
  module API
    module Channels
      
      def call_api(url, access_token)
      end
  
  
      # Get a User's own channel information from Twitch
      # @example
      #   Twitch.client.channel
      #
      # @return [Twitch::Models::Channel] user's channel 
      def channel
        url = "#{Twitch.configuration.twitch_base_url}/channel"
        
        channel = Twitch::Models::Channel.new
        channel.extend(Twitch::Representers::ChannelRepresenter)
        channel.get(:uri => url, :access_token => self.access_token)
        channel
        
      end

      # Get a specific User's channel information from Twitch
      # @example
      #   Twitch.client.channels(channel_name)
      #
      # @return [Twitch::Models::Channel] channel 
      def channels(channel)
        url = "#{Twitch.configuration.twitch_base_url}/channels/#{channel}"

        channel = Twitch::Models::Channel.new
        channel.extend(Twitch::Representers::ChannelRepresenter)
        channel.get(:uri => url, :access_token => self.access_token)
        channel

      end
    end
  end
end