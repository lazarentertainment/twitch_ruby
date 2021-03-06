require 'roar/json'

module Twitch
  module Representers
    module ChannelRepresenter
      include Roar::JSON
      
      property :background
      property :banner
      property :broadcaster_language
      property :created_at
      property :delay
      property :display_name
      property :email
      property :followers
      property :game
      property :language
      property :logo
      property :mature
      property :name
      property :partner
      property :profile_banner
      property :profile_banner_background_color
      property :status
      property :stream_key
      property :updated_at
      property :url
      property :video_banner
      property :views
      property :_id
  
      # link :self do
      #   Twitch.configuration.twitch_base_url + "/channels/#{name}"
      # end
      # link :stream_key do
      #   Twitch.configuration.twitch_base_url + "/channels/#{name}/stream_key"
      # end
      #
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
