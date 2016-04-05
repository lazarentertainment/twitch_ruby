require 'rspec'
require 'spec_helper'

describe Twitch::Client do
  let(:authorization_code) { 'authorization_code' }
  let(:access_token) { '2vqnk2oi2dea2x2lgkq164s8bs1szj' }
  let(:state) { 'somerandomstate' }
  
  let(:client) { Twitch.client(:access_token => access_token) }
  let(:redirect_url) { 'http://localhost:3000/auth/twitch/callback' }
  
  let(:root_response) { '{ "token": { "authorization": { "scopes": ["user_read", "channel_read", "channel_commercial", "user_read"],   "created_at": "2012-05-08T21:55:12Z",   "updated_at": "2012-05-17T21:32:13Z" }, "user_name": "test_user1", "valid": true }, "_links": { "channel": "https://api.twitch.tv/kraken/channel", "users": "https://api.twitch.tv/kraken/users/test_user1", "user": "https://api.twitch.tv/kraken/user", "channels": "https://api.twitch.tv/kraken/channels/test_user1", "chat": "https://api.twitch.tv/kraken/chat/test_user1", "streams": "https://api.twitch.tv/kraken/streams", "ingests":"https://api.twitch.tv/kraken/ingests", "teams": "https://api.twitch.tv/kraken/teams", "search": "https://api.twitch.tv/kraken/search" } }' }

  before do
    Twitch.configure do |c|
      c.client_id = 'client_id'
      c.client_secret = 'client_secret'
      c.redirect_uri = redirect_url
    end 
    
  end
    
  describe '#client' do
    it 'returns a client instance' do
      
      stub_request(:get, "https://api.twitch.tv/kraken/").
        with(:headers => {
          'Accept'=>'application/vnd.twitchtv.v3+json', 
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
          'Authorization'=>'OAuth 2vqnk2oi2dea2x2lgkq164s8bs1szj', 'Content-Type'=>'application/json', 
          'Twitch-Ruby-Version'=>'0.2.0', 'User-Agent'=>'Faraday v0.9.2'
        }).to_return(:status => 200, :body => root_response, :headers => {})

      expect(client).to be_instance_of(Twitch::Client)
    end
  end
  
  
end
