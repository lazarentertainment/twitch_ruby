require 'webmock/rspec'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'twitch_ruby'

#Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }


RSpec.configure do |config|
  #config.infer_spec_type_from_file_location!
  #config.order = "random"
end
