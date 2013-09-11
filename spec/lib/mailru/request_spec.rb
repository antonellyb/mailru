require 'spec_helper'

describe MailRu::Request do

  describe '#make_request' do
    before(:each) { RestClient.stub(:execute) }
    
    it 'use REST methods' do
      RestClient.should_receive(:get)
      TestRequest.make_request(method: 'users.get' )
      RestClient.should_receive(:post)
      TestRequest.make_request(method: 'stream.post')
    end

    it 'can refresh base params' do
      RestClient.should_receive(:get).with(anything, params: hash_including({ app_id: '010' }))
      TestRequest.make_request(method: 'get.info', app_id: '010')
    end

    it 'can use app-server requests' do
      RestClient.should_receive(:get).with(anything, params: hash_including({ sig: '1d0187d8fd7d15338b5fbf847ce79b0e' }))
      TestRequest.make_request(method: 'stream.getBy', secure: '0', uid: '1')
    end
  end
 
end

class TestRequest
  extend MailRu::Request
  MailRu.app_id = '123'
  MailRu.private_key = '123123'
  MailRu.secret_key = '321321'
end
