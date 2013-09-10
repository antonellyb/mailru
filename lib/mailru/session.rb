module MailRu

  class Session

    extend MailRu::Request
    extend MailRu::ApiFunctions

    API.each do |method|
      self.send(:define_method, ruby_name(method)) do |params = {}|
        params[:method] = method
        make_request(request_type(method), params)
      end
    end

    private
      
      def ryby_name(method)
        method.gsub(/([a-z\d])([A-Z])/,'\1_\2').tr('.', '_').downcase
      end

      def request_type(method)
        method.include?('get') ? :get : :post 
      end

  end
  
end
