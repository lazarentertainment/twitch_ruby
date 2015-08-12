require 'roar/json'
require 'twitch_ruby/models/ingest'
require 'twitch_ruby/representers/ingest_representer'

module Twitch
  module Representers
    module IngestRepresenter
      include Roar::JSON
      include Roar::Hypermedia

      property :name
      property :default
      property :url_template
      property :availability
      property :_id
  
    end
  end
end
