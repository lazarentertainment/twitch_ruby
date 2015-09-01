require 'roar/json'

module Twitch
  module Representers
    module RootRepresenter
      include Roar::JSON
    
      #self.representation_wrap = :token

      nested :token do
        nested :authorization do
          property :scopes
          property :created_at
          property :updated_at
        end
        property :user_name
        property :valid
      end

    end
  end
end


# {
#   "token": {
#     "authorization": {
#       "scopes": ["user_read", "channel_read", "channel_commercial", "user_read"],
#       "created_at": "2012-05-08T21:55:12Z",
#       "updated_at": "2012-05-17T21:32:13Z"
#     },
#     "user_name": "test_user1",
#     "valid": true
#   },
#   "_links": {
#     "channel": "https://api.twitch.tv/kraken/channel",
#     "users": "https://api.twitch.tv/kraken/users/test_user1",
#     "user": "https://api.twitch.tv/kraken/user",
#     "channels": "https://api.twitch.tv/kraken/channels/test_user1",
#     "chat": "https://api.twitch.tv/kraken/chat/test_user1",
#     "streams": "https://api.twitch.tv/kraken/streams",
#     "ingests":"https://api.twitch.tv/kraken/ingests",
#     "teams": "https://api.twitch.tv/kraken/teams",
#     "search": "https://api.twitch.tv/kraken/search"
#   }
# }
