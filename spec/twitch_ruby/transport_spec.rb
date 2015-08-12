require 'rspec'
require 'spec_helper'

describe Twitch::Transport do
  # after do
  #   WebMock.reset!
  # end
  let(:access_token) { 'access_token' }
  let(:base_url) { 'https://api.twitch.tv/kraken/' }
  let(:headers) { {'Content-Type'=>'application/json', 'Accept'=>'application/vnd.twitchtv.v3+json', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',  'Authorization' => 'OAuth ' + access_token,  'Twitch-Ruby-Version'=>Twitch::VERSION} }
  let(:transport) { Twitch::Transport.new }
  let(:response) { double(Faraday::Response, body: '') }
  
  before do  
    stub_request(:any, base_url)
    # @stubs = Faraday::Adapter::Test::Stubs.new do |stub|
    #   stub.get('/test') { |env| [200, {}, '{"result": "content"}'] }
    # end
    # allow(connection).to receive(:get).with("/test").and_return('')
  end
  
  RSpec::Matchers.define :faraday_response do |faraday_response|
    headers = response.headers
    # assert_equal [as, as], [headers["Accept"], headers["Content-Type"]]
    # assert_equal "<method>#{type}#{(' - ' + body) if body}</method>", response.body
  end
 
    
  describe '#get_uri' do
    it 'returns response' do
      url = base_url + "test"
      status = 200
      body = 'OK'
      
      stub_request(:get, url).
        with(:headers => headers).to_return(:status => status, :body => body, :headers => {})

      response = transport.get_uri(:uri => url, :access_token => access_token)
      expect(response.status).to eq(status)
      expect(response.body).to be_an_instance_of(String)
      expect(response.body).to eq(body)
    end

  #   it 'raises FormatError if response is not valid JSON' do
  #     stub_request(:get, base_url + "invalid_test").
  #       with(:headers => headers).
  #       to_return(:status => 200, :body => "INVALID", :headers => {})
  #
  #
  #     expect {json = connection.get('invalid_test')}.to raise_error(Twitch::Error::FormatError)
  #   end
  end
  #
  # describe '#errors' do
  #   it 'raises FormatError with request URL' do
  #
  #     stub_request(:any, /.*/).with(:headers => headers).to_return(:status => status, :body => body)
  #
  #     error = false
  #     begin
  #       json = connection.get('404test')
  #     rescue Twitch::Error::FormatError => e
  #       error = true
  #       expect(e.url).to match(/test/)
  #       expect(e.status).to eq(status)
  #       expect(e.body).to eq(body)
  #     end
  #
  #     expect(error).to be_truthy
  #   end
  #
  #   it 'raises ClientError when HTTP status is 404' do
  #
  #     stub_request(:get, base_url + "404test").
  #       with(:headers => headers).to_return(:status => 404, :body => "", :headers => {})
  #
  #     #expect {json = connection.get('404test')}.to raise_error(Twitch::Error::ClientError)
  #
  #     error = false
  #     begin
  #       json = connection.get('404test')
  #     rescue Twitch::Error::ClientError => e
  #       error = true
  #       expect(e.url).to match(/404test/)
  #       expect(e.status).to eq(404)
  #       expect(e.body).to eq('')
  #     end
  #
  #     expect(error).to be_truthy
  #   end
  #
  #   it 'raises ServerError when HTTP status is 500' do
  #     stub_request(:get, base_url + "channels/FNORD").
  #       with(:headers => headers).to_return(:status => 500, :body => "", :headers => {})
  #
  #     error = false
  #     begin
  #       json = connection.get('channels/FNORD')
  #     rescue Twitch::Error::ServerError => e
  #       error = true
  #       expect(e.url).to match(/FNORD/)
  #       expect(e.status).to eq(500)
  #       expect(e.body).to eq('')
  #     end
  #
  #     expect(error).to be_truthy
  #   end
  # end
end
