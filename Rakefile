require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec


desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r twitch_ruby.rb"



end




# Twitch.configure { |config| config.client_id = '6a6v0kcloeb7wthioh0ta6if5j1wggc'; config.client_secret = 'nxhm8qdio8mse1i85sergm31zlkwto6' }
