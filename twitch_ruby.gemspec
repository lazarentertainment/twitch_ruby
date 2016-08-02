# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twitch_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "twitch_ruby"
  spec.version       = Twitch::VERSION
  spec.authors       = ["Lee Horrocks"]
  spec.email         = ["lee@lazarentertainment.com"]

  spec.summary       = %q{Twitch API V3 Client}
  spec.description   = %q{Provides an implemntation of a client for the Twitch API (V3), that returns Ruby objects for the API data}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'
  spec.add_dependency 'multi_json'
  spec.add_dependency 'representable'
  spec.add_dependency 'roar', '~> 1.0.1'
  spec.add_dependency 'logging'
  
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
  
end
