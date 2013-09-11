require 'spec_helper'

describe MailRu::ConnectionError do

  it 'Exception child' do
    expect(MailRu::ConnectionError.superclass).to be(Exception)
  end

  it 'returns error kind in message' do
    error = MailRu::ConnectionError.new(SocketError.new)
    expect(error.message).to eq('SocketError')
  end

end
