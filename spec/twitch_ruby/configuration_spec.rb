require 'rspec'
require 'spec_helper'

module Twitch
  describe Configuration do
  
    before do
      Twitch.configure do |c| 
        c.client_id = 'client_id'
        c.client_secret = 'client_secret' 
      end 
    end


    describe "#configure" do
      it "returns the client_id" do
        expect(Twitch.configuration.client_id).to be_a(String)
        expect(Twitch.configuration.client_id).to eq('client_id')      
      end
    end
  
  
    describe "#test_mode" do
      it "default value is false" do
        expect(Twitch.configuration.test_mode).to be false
      end
    end
  end
end