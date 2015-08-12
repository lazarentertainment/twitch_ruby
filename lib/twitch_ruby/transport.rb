require 'faraday'
require 'json'
require 'twitch_ruby'

module Twitch
  class Transport


    def get_uri(options)
      response = build_connection(options[:uri], options[:access_token]).get
      puts response.body
      response
    end

    def post_uri(options)
      build_connection(options[:uri], options[:access_token]).post(nil, options[:body])
    end

    def put_uri(options)
      build_connection(options[:uri], options[:access_token]).put(nil, options[:body])
    end

    def patch_uri(options)
      build_connection(options[:uri], options[:access_token]).patch(nil, options[:body])
    end

    def delete_uri(options)
      build_connection(options[:uri], options[:access_token]).delete
    end

    private

      def build_connection(uri, access_token)
      
        current_headers = {
          'Authorization' => 'OAuth ' + access_token
        }.merge(default_headers)
        
        Faraday.new(:url => uri, :headers => current_headers) do |faraday|
          faraday.use ::Faraday::Response::RaiseError
          #faraday.response :logger
          faraday.adapter ::Faraday.default_adapter
        end
        
      end
    
      def default_headers
        headers = {
          'Content-Type' => 'application/json',
          'Accept' => 'application/vnd.twitchtv.v3+json',
          'Twitch-Ruby-Version' => Twitch::VERSION
        }
        headers
      end
      
  end
end

# Pagination
#
# def accumulate(options, &block)
#   path = options[:path]
#   params = options[:params] || {}
#   json = options[:json]
#   sub_json = options[:sub_json]
#   create = options[:create]
#
#   raise ArgumentError, 'json' if json.nil?
#   raise ArgumentError, 'path' if path.nil?
#   raise ArgumentError, 'create' if create.nil?
#
#   if create.is_a? Class
#     klass = create
#     create = -> hash { klass.new(hash) }
#   end
#
#   total_limit = options[:limit]
#   page_limit = [total_limit || 100, 100].min
#   offset = options[:offset] || 0
#
#   ids = Set.new
#   objects = []
#   count = 0
#
#   block ||= -> object {
#     objects << object
#   }
#
#   paginate(path, page_limit, offset, params) do |response_json|
#     current_objects = response_json[json]
#     current_objects.each do |object_json|
#       object_json = object_json[sub_json] if sub_json
#       object = create.call(object_json)
#       if ids.add?(object.id)
#         count += 1
#         block.call(object)
#         if count == total_limit
#           return block_given? ? nil : objects
#         end
#       end
#     end
#
#     break if current_objects.empty? || (current_objects.count < page_limit)
#   end
#
#   return block_given? ? nil : objects
# end
#
# def paginate(path, limit, offset, params = {})
#   path_uri = Addressable::URI.parse(path)
#   query = { 'limit' => limit, 'offset' => offset }
#   path_uri.query_values ||= {}
#   path_uri.query_values = path_uri.query_values.merge(query)
#
#   request_url = path_uri.to_s
#
#   json = get(request_url, params)
#
#   loop do
#     break if json['error'] && (json['status'] == 503)
#     yield json
#
#     links = json['_links']
#     next_url = links['next']
#
#     next_uri = Addressable::URI.parse(next_url)
#     offset = next_uri.query_values['offset'].to_i
#
#     total = json['_total']
#     break if total && (offset > total)
#
#     request_url = next_url
#     json = get(request_url, params)
#   end
# end