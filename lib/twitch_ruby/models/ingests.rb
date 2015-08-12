require 'twitch_ruby/models/base'
require 'twitch_ruby/representers/ingests_representer'

module Twitch
  module Models

    class Ingests < Base
      include Twitch::Representers::IngestsRepresenter

      def pass
        false
      end
    end
  
  end
end