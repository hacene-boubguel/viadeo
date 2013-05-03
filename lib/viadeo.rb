require "multi_json"
require "faraday"

#Utils
require "viadeo/version"
require "viadeo/util"

#Graph Objects
require "viadeo/graph_object"

#error
require "viadeo/error"

module Viadeo
  class << self
    def version_string
      "Viadeo version #{Viadeo::VERSION}"
    end
  end
end
