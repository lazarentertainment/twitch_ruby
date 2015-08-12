require 'roar/json'

module Twitch
  module Representers
    module IngestsRepresenter
      include Roar::JSON
      
      property :_id

      #collection_representer class: Twitch::Models::Ingest
      collection :ingests, :extend => Twitch::Representers::IngestRepresenter, :class => Twitch::Models::Ingest
      #items extend: Twitch::Representers::IngestRepresenter, class: Twitch::Models::Ingest
      
      #
      # collection :ingests, class: ::Twitch::Models::Ingest do
      #   property :name
      #   property :default
      #   property :url_template
      #   property :availability
      #   property :_id
      # end
      
    end
  end
end
