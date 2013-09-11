require 'spec_helper'

describe MailRu::ApiFunctions do

  describe '#ruby_name' do
    it 'rebuild given string with ruby way rules' do
      name = 'Some.MethodSome.name'
      expect(MailRu::Session::ruby_name(name)).to eql('some_method_some_name')
    end
  end

end
