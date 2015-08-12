require 'roar/json'

module Twitch
  module Representers
    module GameRepresenter
      include Roar::JSON
      
      property :name
      property :box
      property :logo
      property :_id
      property :giantbomb_id
    end
  end
end