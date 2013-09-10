require 'restclient'
require 'json'

module Mailru
  
  autoload :Request, 'mailru/request'

  autoload :ConnectionError,  'mailru/errors/connection_error'
  autoload :RequestError,     'mailru/errors/request_error'

  class << self
    attr_accessor :app_id, :secret_key, :private_key, :access_token
  end
end
