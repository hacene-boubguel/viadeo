module Viadeo
  module Operations
    module Create
      def create(options={})
        data = Viadeo.request(:post, url: url , access_token: @access_token, params: options)
        refresh_from(data, @access_token)
        self
      end
      alias_method :post, :create
    end
  end
end
