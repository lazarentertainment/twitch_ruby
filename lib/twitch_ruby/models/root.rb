require 'twitch_ruby/models/base'
require 'twitch_ruby/representers/root_representer'

module Twitch
  module Models

    class Root < Base
      include Twitch::Representers::RootRepresenter
      
    end
  
  end
end