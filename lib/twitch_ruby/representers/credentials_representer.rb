require 'roar/json/hal'

# {
#   "access_token": "fwc3m979ukiooa8vud96dkqxe262vq",
#   "scope": [
#     "channel_read",
#     "channel_stream"
#   ],
#   "refresh_token": "eyJfaWQiOiIxMzEwMTA3NDciLCJfdXVpZCI6IjRhZjhhOTc5LTA5YmItNDg1MC1hMGM0LWRhMGZlZTcyYjFkOSJ9%wjrCXALbgZ3S5YxiaHTFVm8Ba+B5qc09j0jE931Lelw="
# }

module Twitch
  module Representers
    module CredentialsRepresenter
      include Roar::JSON::HAL
      #include Roar::Hypermedia

      property :access_token
      property :refresh_token
      property :expires_in
      property :scope
    end
  end
end
