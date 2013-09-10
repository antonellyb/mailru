module MailRu

  class Session

    include MailRu::Request
    extend MailRu::ApiFunctions

    functions.each do |method|
      self.send(:define_method, ruby_name(method)) do |params = {}|
        params[:method] = method
        JSON.parse(make_request(params))
      end
    end

  end
  
end
