require 'twitch_ruby/models/base'
require 'twitch_ruby/representers/user_representer'

module Twitch
  module Models

    class User < Base
      include Twitch::Representers::UserRepresenter
      
      def mature?
        @mature
      end
    end
  
  end
end