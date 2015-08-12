require 'roar/json/hal'



module Twitch
  module Representers
    # Streams are video broadcasts that are currently live. They belong to a user and are part of a channel.
    # @see Streams#get Streams#get
    # @see Streams#find Streams#find
    # @see Streams#featured Streams#featured
    # @see Streams
    # @see Channel
    # @see https://github.com/justintv/Twitch-API/blob/master/v3_resources/streams.md#get-streams
    module StreamRepresenter
      include Roar::JSON::HAL
      include Roar::Hypermedia
      #include PaginationRepresenter

      property :game
      property :viewers
      #embedded :channel
      #:preview
      property :average_fps
      property :video_height
      property :created_at
      property :preview
      property :_id
      
    end
  end
end