module MailRu 

  class RequestError < Exception
    
    def initialize(e)
      super(build_message(e))
    end

    private
      
      def build_message(e)
        body = JSON.parse(e.response)
        "#{body['error']['error_code']} : #{body['error']['error_msg']}" if body['error']
      end
  end

end
