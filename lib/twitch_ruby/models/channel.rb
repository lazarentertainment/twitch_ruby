require 'twitch_ruby/models/base'
require 'twitch_ruby/representers/channel_representer'

module Twitch
  module Models

    class Channel < Base
      include Twitch::Representers::ChannelRepresenter
      
      def mature?
        @mature
      end
    end
  
  end
end