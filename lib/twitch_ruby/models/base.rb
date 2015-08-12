require 'ostruct' 
require 'roar/client'
require 'roar/json'
require 'roar/json/hal'
require 'twitch_ruby/id_equality'
require 'twitch_ruby/representers/channel_representer'

module Twitch
  module Models

    class Base < OpenStruct
      #include Roar::JSON::HAL
      include Roar::JSON
      include Roar::Client
      include Twitch::IdEquality
    end
  end  
  
end