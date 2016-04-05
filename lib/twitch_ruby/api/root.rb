require 'twitch_ruby/models/root'
require 'twitch_ruby/representers/root_representer'

module Twitch
  module API
    module Root
  
      # Get a User's root information from Twitch
      # @example
      #   Twitch.client.root
      #
      # @return [Twitch::Models::Root] user's root 
      def root
        url = "#{Twitch.configuration.twitch_base_url}/"
        root = Twitch::Models::Root.new
        root.extend(Twitch::Representers::RootRepresenter)
        root.get(:uri => url, :access_token => self.access_token)
        root
      end


    end
  end
end