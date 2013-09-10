require 'spec_helper'

describe MailRu::Request do

  describe '.make_request' do
    before(:each) { RestClient.stub(:execute) }
    
    it 'use REST methods' do
      RestClient.should_receive(:get)
      TestRequest.make_request(:get)
      RestClient.should_receive(:post)
      TestRequest.make_request(:post)
    end

    it 'can refresh base params' do
      RestClient.should_receive(:get).with(anything, params: hash_including({ app_id: '010' }))
      TestRequest.make_request(:get, app_id: '010')
    end

    it 'can use app-server requests' do
      RestClient.should_receive(:get).with(anything, params: hash_including({ sig: '51868460e763be3add0ad2149063ffd6' }))
      TestRequest.make_request(:get, { secure: '0', uid: 'uid' })
    end
  end
 
end

class TestRequest
  extend MailRu::Request
  MailRu.app_id = '123'
  MailRu.private_key = '123123'
  MailRu.secret_key = '321321'
end
