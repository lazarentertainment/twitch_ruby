require 'ostruct' 
require 'roar/client'
require 'roar/json/hal'
require 'twitch_ruby/representers/channel_representer'

module Twitch::Models

  class Channel < OpenStruct
    include Roar::JSON::HAL
    include Roar::Client
    include Twitch::IdEquality
    include Twitch::Representers::ChannelRepresenter
  
    def mature?
      @mature
    end
  end
  
  
end