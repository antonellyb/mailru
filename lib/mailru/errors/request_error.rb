module MailRu 

  class RequestError < Exception
    
    def initialize(e)
      JSON.parse(e.response.body)
      super(error.message)
    end

  end

end
