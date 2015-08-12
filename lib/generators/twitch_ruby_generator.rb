class TwitchRuby < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__))
  def copy_initializer
    copy_file 'twitch_ruby.rb', 'config/initializers/twitch_ruby.rb'
  end
end