require 'spec_helper'

describe Twitch::API::User do

  let(:access_token) { 'access_token' }
  let(:state) { 'somerandomstate' }

  let(:client) { Twitch.client(:access_token => access_token) }
  let(:redirect_url) { 'http://localhost:3000/auth/twitch/callback' }

  let(:root_response) { '{ "token": { "authorization": { "scopes": ["user_read", "user_read", "user_commercial", "user_read"],   "created_at": "2012-05-08T21:55:12Z",   "updated_at": "2012-05-17T21:32:13Z" }, "user_name": "test_user1", "valid": true }, "_links": { "user": "https://api.twitch.tv/kraken/user", "users": "https://api.twitch.tv/kraken/users/test_user1", "user": "https://api.twitch.tv/kraken/user", "users": "https://api.twitch.tv/kraken/users/test_user1", "chat": "https://api.twitch.tv/kraken/chat/test_user1", "streams": "https://api.twitch.tv/kraken/streams", "ingests":"https://api.twitch.tv/kraken/ingests", "teams": "https://api.twitch.tv/kraken/teams", "search": "https://api.twitch.tv/kraken/search" } }' }

  let(:user_response) { '{"type": "user","name": "test_user1","created_at": "2011-06-03T17:49:19Z","updated_at": "2012-06-18T17:19:57Z","_links": {  "self": "https://api.twitch.tv/kraken/users/test_user1"},"logo": "http://static-cdn.jtvnw.net/jtv_user_pictures/test_user1-profile_image-62e8318af864d6d7-300x300.jpeg","_id": 22761313,"display_name": "test_user1","email": "asdf@asdf.com","partnered": true,"bio": "test bio woo I\'m a test user","notifications": {  "email": true,  "push": false} }' }

  before do
    Twitch.configure do |c|
      c.client_id = 'client_id'
      c.client_secret = 'client_secret'
      c.redirect_uri = redirect_url
    end

  end

  describe '#user' do
    it 'returns a user model instance' do
      stub_request(:get, "https://api.twitch.tv/kraken/").
        with(:headers => {
          'Client-ID' => Twitch.configuration.client_id,
          'Accept'=>'application/vnd.twitchtv.v3+json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'OAuth access_token', 'Content-Type'=>'application/json',
          'Twitch-Ruby-Version'=>Twitch::VERSION, 'User-Agent'=>'Faraday v0.12.2'
        }).to_return(:status => 200, :body => root_response, :headers => {})

      stub_request(:get, "https://api.twitch.tv/kraken/user").
        with(:headers => {
          'Client-ID' => Twitch.configuration.client_id,
          'Accept'=>'application/vnd.twitchtv.v3+json',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'OAuth access_token', 'Content-Type'=>'application/json', 'Twitch-Ruby-Version'=>Twitch::VERSION,
          'User-Agent'=>'Faraday v0.12.2'
        }).to_return(:status => 200, :body => user_response, :headers => {})

      result = client.user

      expect(result).to be_instance_of(Twitch::Models::User)
      expect(result.name).to eq('test_user1')

    end
  end

end
