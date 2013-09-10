require 'restclient'
require 'json'

module MailRu
  
  autoload :Request,          'mailru/request'
  autoload :Session,          'mailru/session'
  autoload :ApiFunctions,     'mailru/api_functions'

  autoload :ConnectionError,  'mailru/errors/connection_error'
  autoload :RequestError,     'mailru/errors/request_error'

  class << self
    attr_accessor :app_id, :secret_key, :private_key, :session_key
  end

end
