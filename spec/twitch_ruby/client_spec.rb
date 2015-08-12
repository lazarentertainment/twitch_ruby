require 'rspec'
require 'spec_helper'

describe Twitch::Client do
  let(:authorization_code) { 'authorization_code' }
  let(:access_token) { 'access_token' }
  let(:state) { 'somerandomstate' }
  
  let(:client) { Twitch.client(:access_token => access_token) }
  let(:redirect_url) { 'http://localhost:3000/auth/twitch/callback' }
  
  before do
    Twitch.configure do |c| 
      c.client_id = 'client_id'
      c.client_secret = 'client_secret'
      c.redirect_uri = redirect_url
    end 
    
  end
    
  describe '#client' do
    it 'returns a client instance' do
      expect(client).to be_instance_of(Twitch::Client)
    end
  end
  
  
end