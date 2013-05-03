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
    end
  end
end
