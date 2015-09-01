require 'twitch_ruby/api/root'
require 'twitch_ruby/api/channels'
require 'twitch_ruby/api/ingests'

module Twitch
  module API
    include Twitch::API::Root
    include Twitch::API::Channels
    include Twitch::API::Ingests
  end
end