
require 'twitch_ruby/api/channels'
require 'twitch_ruby/api/ingests'
require 'twitch_ruby/api/streams'

module Twitch
  module API
    include Twitch::API::Channels
    include Twitch::API::Ingests
    #include Twitch::API::Streams
  end
end