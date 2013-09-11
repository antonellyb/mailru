module MailRu
  
  module Request

    API_URI = "http://www.appsmail.ru/platform/api" 

    def make_request(params = {})

      params[:app_id] ||= MailRu.app_id
      params[:secure] ||= '1'
      params[:sig]    ||= sig(params)
      
      begin
        RestClient.send(*build(params))
      rescue RestClient::Unauthorized,
             RestClient::Forbidden, 
             RestClient::BadRequest,
             RestClient::ResourceNotFound => e
        raise MailRu::RequestError.new(e)
      rescue SocketError => e
        raise MailRu::ConnectionError.new(e)
      end

    end
    
    private

      def sig(params)
        if params[:secure].eql?('0')
          Digest::MD5.hexdigest(params[:uid] + sig_params(params) + MailRu.private_key)
        else
          Digest::MD5.hexdigest(sig_params(params) + MailRu.secret_key)
        end   
      end

      def sig_params(params)
        Hash[params.sort].map { |key, value| "#{key}=#{value}" }.join('')
      end

      def build(params)
        if params[:method].include?('post')
          [:post, API_URI, params]
        else
          [:get, API_URI, params: params]
        end
      end

  end

end
