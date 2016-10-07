# Twitch-Ruby

[ ![Codeship Status for lazarentertainment/twitch_ruby](https://codeship.com/projects/0427ce90-95f4-0133-4170-5e03461aa760/status?branch=master)](https://codeship.com/projects/125347)

The Gem provides a (currently incomplete) ruby implementation of the [https://github.com/justintv/Twitch-API](Twitch V3 API)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twitch_ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twitch_ruby

## Usage

Create a Rails initializer (or equivalent)

```ruby
Twitch.configure do |config|
  config.client_id = <your-client-id>
  config.client_secret = <your-secret>
  config.redirect_uri = 'https://your-server/auth/twitch/callback'
end
```

## Development

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lazarentertainment/twitch_ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

