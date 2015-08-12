require 'roar/json/hal'

#https://github.com/justintv/Twitch-API/blob/master/v3_resources/chat.md#get-chatemoticons
# {
#   "regex": "\:-?\(",
#   "images": [
#     {
#       "emoticon_set": null,
#       "height": 18,
#       "width": 24,
#       "url": "http://static-cdn.jtvnw.net/jtv_user_pictures/chansub-global-emoticon-d570c4b3b8d8fc4d-24x18.png"
#     },
#     {
#       "emoticon_set": 33,
#       "height": 18,
#       "width": 21,
#       "url": "http://static-cdn.jtvnw.net/jtv_user_pictures/chansub-global-emoticon-c41c5c6c88f481cd-21x18.png"
#     }
#   ]
# }

module Twitch
  module Representers
    module EmoticonRepresenter
      include Roar::JSON::HAL
      
      property :regex
      
    end
  end
end