module Viadeo
  module Operations
    module List
      def all(options={})
        data = Viadeo.request(:get, url: "#{url}/list" , access_token: @access_token, params: options)
        refresh_from(data, @access_token)
        self
      end
      alias_method :list, :all
    end
  end
end
