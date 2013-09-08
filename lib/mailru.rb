require 'restclient'

module Mailru
  
  autoload :Request, 'mailru/request'

  class << self
    attr_accessor :app_id, :secret_key, :private_key, :access_token
  end
end
