require 'twitch_ruby/api/root'
require 'twitch_ruby/api/channels'
require 'twitch_ruby/api/ingests'
require 'twitch_ruby/api/user'

module Twitch
  module API
    include Twitch::API::Root
    include Twitch::API::Channels
    include Twitch::API::Ingests
    include Twitch::API::User
  end
end