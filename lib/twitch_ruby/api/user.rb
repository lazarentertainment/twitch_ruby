require 'twitch_ruby/models/user'
require 'twitch_ruby/representers/user_representer'

module Twitch
  module API
    module User
      
      def call_api(url, access_token)
      end
  
  
      # Get a User's own information from Twitch
      # @example
      #   Twitch.client.user
      #
      # @return [Twitch::Models::User] user
      def user
        url = "#{Twitch.configuration.twitch_base_url}/user"
        
        user = Twitch::Models::User.new
        user.extend(Twitch::Representers::UserRepresenter)
        user.get(:uri => url, :access_token => self.access_token)
        user
        
      end

    end
  end
end