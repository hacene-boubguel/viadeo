module Viadeo
  module Operations
    module Get
      def find(options={})
        data = Viadeo.request(:get, url: url , access_token: @access_token, params: options)
        refresh_from(data, @access_token)
        self
      end
      alias_method :retrieve, :find
      alias_method :get, :find
    end
  end
end
