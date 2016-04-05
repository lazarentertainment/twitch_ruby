require 'twitch_ruby/models/ingest'
require 'twitch_ruby/models/ingests'
require 'twitch_ruby/representers/ingest_representer'
require 'twitch_ruby/representers/ingests_representer'

module Twitch
  module API
    module Ingests

      # {
      #   "_links": {
      #     "self": "https://api.twitch.tv/kraken/ingests"
      #   },
      #   "ingests": [
      #     {
      #       "name": "EU: Amsterdam, NL",
      #       "default": false,
      #       "_id": 24,
      #       "url_template": "rtmp://live-ams.twitch.tv/app/{stream_key}",
      #       "availability": 1.0
      #     },
      #     ...
      #   ]
      # }      
      def ingests
        url = "#{Twitch.configuration.twitch_base_url}/ingests"
        ingests = Twitch::Models::Ingests.new
        ingests.extend(Twitch::Representers::IngestsRepresenter)
        ingests.get(:uri => url) #, :access_token => self.access_token)
        ingests
      end
    end
  end
end