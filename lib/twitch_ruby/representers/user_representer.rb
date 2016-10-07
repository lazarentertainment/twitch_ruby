require 'roar/json'

module Twitch
  module Representers
    module UserRepresenter
      include Roar::JSON
      
      property :type
      property :name
      property :logo
      property :url
      property :_id
      property :display_name
      property :email
      property :partnered
      property :bio
      property :created_at
      property :updated_at
  
      # link :self do
      #   Twitch.configuration.twitch_base_url + "/users/#{name}"
      # end

    end
  end
end

#
#
# "_links": {
#   "self": "https://api.twitch.tv/kraken/channels/test_channel",
#   "follows": "https://api.twitch.tv/kraken/channels/test_channel/follows",
#   "commercial": "https://api.twitch.tv/kraken/channels/test_channel/commercial",
#   "stream_key": "https://api.twitch.tv/kraken/channels/test_channel/stream_key",
#   "chat": "https://api.twitch.tv/kraken/chat/test_channel",
#   "features": "https://api.twitch.tv/kraken/channels/test_channel/features",
#   "subscriptions": "https://api.twitch.tv/kraken/channels/test_channel/subscriptions",
#   "editors": "https://api.twitch.tv/kraken/channels/test_channel/editors",
#   "teams": "https://api.twitch.tv/kraken/channels/test_channel/teams",
#   "videos": "https://api.twitch.tv/kraken/channels/test_channel/videos"
# },
