module Viadeo
  class Util
    class << self
      def convert_to_graph_object(data, access_token)
        case data
        when Array
          data.map {|v| convert_to_graph_object(v, access_token) }
        when Hash
          data[:id].nil? ? data : Viadeo::GraphObject.new_from(data, access_token)
        else
          data
        end
      end

      def filter_response(response)
        data = response.body.split("\r\n\r\n")[-1]
        data = MultiJson.load(data, :symbolize_keys => true)
      end
    end
  end
end
