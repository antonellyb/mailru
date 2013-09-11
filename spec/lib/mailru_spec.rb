require 'spec_helper'

describe MailRu do
 
  it 'allow setting up base values' do
    expect(MailRu.respond_to? :app_id=).to be_true
    expect(MailRu.respond_to? :secret_key=).to be_true
    expect(MailRu.respond_to? :private_key=).to be_true
  end 

end
