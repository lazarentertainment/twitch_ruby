require 'roar/json'
require 'twitch_ruby/models/base'
require 'twitch_ruby/representers/ingest_representer'

module Twitch
  module Models

    class Ingest < Base
      include Twitch::Representers::IngestRepresenter

      def thing
        false
      end
      
    end
  
  end
end