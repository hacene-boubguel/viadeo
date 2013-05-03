module Viadeo
  module Operations
    module Update
      def update(options={})
        data = Viadeo.request(:put, url: url , access_token: @access_token, params: options)
        refresh_from(data, @access_token)
        self
      end

      def save
        if updated?
          update(params)
        end
        self
      end

      private
      def params
        values = {}
        @updated_attributes.each { |k| values[k] = @values[k] }
        values
      end
    end
  end
end
