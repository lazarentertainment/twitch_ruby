require 'rspec'
require 'spec_helper'
require 'cgi'

describe Twitch::Authenticator do
  # after do
  #   WebMock.reset!
  # end
  let(:authorization_code) { 'authorization_code' }
  let(:state) { 'somerandomstate' }

  let(:headers) { {'Content-Type'=>'application/x-www-form-urlencoded' } }
  let(:authenticator) { Twitch::Authenticator.new }
  
  before do
    Twitch.configure do |c| 
      c.client_id = 'client_id'
      c.client_secret = 'client_secret'
      c.redirect_uri = 'http://localhost:3000/auth/twitch/callback'
    end 
  end
    
  describe '#authenticate' do
    it 'returns response' do

      redirect_url = 'http://localhost:3000/auth/twitch/callback'
      status = 200
      body = '{"access_token": "fwc3m979ukiooa8vud96dkqxe262vq", "scope": [ "channel_read", "channel_stream" ], "refresh_token": "eyJfaWQiOiIxMzEwMTA3NDciLCJfdXVpZCI6IjRhZjhhOTc5LTA5YmItNDg1MC1hMGM0LWRhMGZlZTcyYjFkOSJ9%wjrCXALbgZ3S5YxiaHTFVm8Ba+B5qc09j0jE931Lelw="}'
      
      stub_request(:post, "https://api.twitch.tv/kraken/oauth2/token").
        with(:body => {"code"=>authorization_code, "redirect_uri"=>redirect_url, "client_id"=>"client_id", "client_secret"=>"client_secret", "scope"=>"", "grant_type"=>"authorization_code", "state"=> state},
        :headers => {'Accept'=>'*/*', 'Content-Type'=>'application/x-www-form-urlencoded'}).to_return(:status => status, :body => body, :headers => {})
        
      response = authenticator.authenticate(:authorization_code => authorization_code, :state => state)


      credentials = Twitch::Models::Credentials.new
      credentials.extend(Twitch::Representers::CredentialsRepresenter)
      credentials.from_json(body)
      expect(response).to eq(credentials)
    end
  end
  
  
end