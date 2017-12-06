require 'spec_helper'

describe Twitch::API::Channels do

  let(:access_token) { 'access_token' }
  let(:state) { 'somerandomstate' }

  let(:client) { Twitch.client(:access_token => access_token) }
  let(:redirect_url) { 'http://localhost:3000/auth/twitch/callback' }

  let(:root_response) { '{ "token": { "authorization": { "scopes": ["user_read", "channel_read", "channel_commercial", "user_read"],   "created_at": "2012-05-08T21:55:12Z",   "updated_at": "2012-05-17T21:32:13Z" }, "user_name": "test_user1", "valid": true }, "_links": { "channel": "https://api.twitch.tv/kraken/channel", "users": "https://api.twitch.tv/kraken/users/test_user1", "user": "https://api.twitch.tv/kraken/user", "channels": "https://api.twitch.tv/kraken/channels/test_user1", "chat": "https://api.twitch.tv/kraken/chat/test_user1", "streams": "https://api.twitch.tv/kraken/streams", "ingests":"https://api.twitch.tv/kraken/ingests", "teams": "https://api.twitch.tv/kraken/teams", "search": "https://api.twitch.tv/kraken/search" } }' }

  let(:channel_response) { '{ "mature": false, "status": "test status", "broadcaster_language": "en", "display_name": "test_channel", "game": "Gaming Talk Shows", "delay": 0, "language": "en", "_id": 12345, "name": "test_channel", "created_at": "2007-05-22T10:39:54Z", "updated_at": "2015-02-12T04:15:49Z", "logo": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_channel-profile_image-94a42b3a13c31c02-300x300.jpeg", "banner": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_channel-channel_header_image-08dd874c17f39837-640x125.png", "video_banner": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_channel-channel_offline_image-b314c834d210dc1a-640x360.png", "background": null, "profile_banner": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_channel-profile_banner-6936c61353e4aeed-480.png", "profile_banner_background_color": "null", "partner": true, "url": "http://www.twitch.tv/test_channel", "views": 49144894, "followers": 215780, "_links": { "self": "https://api.twitch.tv/kraken/channels/test_channel",   "follows": "https://api.twitch.tv/kraken/channels/test_channel/follows",   "commercial": "https://api.twitch.tv/kraken/channels/test_channel/commercial", "stream_key": "https://api.twitch.tv/kraken/channels/test_channel/stream_key", "chat": "https://api.twitch.tv/kraken/chat/test_channel", "features": "https://api.twitch.tv/kraken/channels/test_channel/features", "subscriptions": "https://api.twitch.tv/kraken/channels/test_channel/subscriptions", "editors": "https://api.twitch.tv/kraken/channels/test_channel/editors", "teams": "https://api.twitch.tv/kraken/channels/test_channel/teams", "videos": "https://api.twitch.tv/kraken/channels/test_channel/videos" }, "email": "test_channel@twitch.tv", "stream_key": "live_5439587_s8df7s9d7g6dsfggsdfg" }' }


  before do
    Twitch.configure do |c|
      c.client_id = 'client_id'
      c.client_secret = 'client_secret'
      c.redirect_uri = redirect_url
    end

  end

  describe '#channel' do
    it 'returns a channel model instance' do
      stub_request(:get, "https://api.twitch.tv/kraken/").
        with(:headers => {
          'Client-ID' => Twitch.configuration.client_id,
          'Accept'=>'application/vnd.twitchtv.v3+json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'OAuth access_token', 'Content-Type'=>'application/json',
          'Twitch-Ruby-Version'=>Twitch::VERSION, 'User-Agent'=>'Faraday v0.12.2'
        }).to_return(:status => 200, :body => root_response, :headers => {})

      stub_request(:get, "https://api.twitch.tv/kraken/channel").
        with(:headers => {
          'Client-ID' => Twitch.configuration.client_id,
          'Accept'=>'application/vnd.twitchtv.v3+json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'OAuth access_token', 'Content-Type'=>'application/json', 'Twitch-Ruby-Version'=>Twitch::VERSION,
          'User-Agent'=>'Faraday v0.12.2'
        }).to_return(:status => 200, :body => channel_response, :headers => {})

      result = client.channel

      expect(result).to be_instance_of(Twitch::Models::Channel)
      expect(result.stream_key).to eq('live_5439587_s8df7s9d7g6dsfggsdfg')

    end
  end

  describe '#channels' do
    it 'returns a channel model instance' do
      stub_request(:get, "https://api.twitch.tv/kraken/").
        with(:headers => {
          'Client-ID' => Twitch.configuration.client_id,
          'Accept'=>'application/vnd.twitchtv.v3+json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'OAuth access_token', 'Content-Type'=>'application/json',
          'Twitch-Ruby-Version'=>Twitch::VERSION, 'User-Agent'=>'Faraday v0.12.2'
        }).to_return(:status => 200, :body => root_response, :headers => {})

      stub_request(:get, "https://api.twitch.tv/kraken/channels/test_channel").
        with(:headers => {
          'Accept'=>'application/vnd.twitchtv.v3+json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'OAuth access_token',
          'Client-Id'=>'client_id',
          'Content-Type'=>'application/json', 'Twitch-Ruby-Version'=> Twitch::VERSION,
          'User-Agent'=>'Faraday v0.12.2'
        }).to_return(:status => 200, :body => channel_response, :headers => {})

      result = client.channels('test_channel')

      expect(result).to be_instance_of(Twitch::Models::Channel)
      expect(result.stream_key).to eq('live_5439587_s8df7s9d7g6dsfggsdfg')

    end
  end

end
