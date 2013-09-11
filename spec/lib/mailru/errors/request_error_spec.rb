require 'spec_helper'

describe MailRu::RequestError do
  
  it 'Exception child' do
    expect(MailRu::ConnectionError.superclass).to be(Exception)
  end
  
end
