module Mailru
  
  module Request

    API_URI = "http://www.appsmail.ru/platform/api" 

    def make_request(method, params = {})

      params[:app_id] ||= Mailru.app_id
      params[:secure] ||= '1'
      params[:sig]    ||= sig(params)
      
      begin
        RestClient.send(method, API_URI, params: params)
      rescue RestClient::Unauthorized,
             RestClient::Forbidden, 
             RestClient::BadRequest,
             RestClient::ResourceNotFound => e
        raise Mailru::RequestError.new(e)
      rescue SocketError => e
        raise Mailru::ConnectionError.new(e)
      end
    end
    
    private

      def sig(params)
        if params[:secure].eql?('0')
          Digest::MD5.hexdigest(params[:uid] + sig_params(params) + Mailru.private_key)
        else
          Digest::MD5.hexdigest(sig_params(params) + Mailru.secret_key)
        end   
      end

      def sig_params(params)
        Hash[params.sort].map { |key, value| "#{key}=#{value}" }.join('')
      end
  end

end
