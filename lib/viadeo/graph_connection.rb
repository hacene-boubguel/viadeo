module Viadeo 
  class GraphConnection < GraphObject

    def initialize(access_token, options={})
      @connection = options[:connection] if options[:connection]
      super(access_token, options)
    end
  end
end

