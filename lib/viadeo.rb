require "multi_json"
require "faraday"

#Utils
require "viadeo/version"
require "viadeo/util"
require "viadeo/configuration"
require "viadeo/request"

#Operations
require "viadeo/operations/create"
require "viadeo/operations/update"
require "viadeo/operations/get"
require "viadeo/operations/list"

#Graph Objects
require "viadeo/graph_object"
require "viadeo/graph_connection"
require "viadeo/user"
require "viadeo/newsfeed"
require "viadeo/recommend"
require "viadeo/reference_data"
require "viadeo/search"
require "viadeo/status"

#error
require "viadeo/error"

module Viadeo
  class << self
    def version_string
      "Viadeo version #{Viadeo::VERSION}"
    end

    # Configure Viadeo parameters by passing block 
    # === Example
    #  Viadeo.configure do |config|
    #    config.logger = logger
    #    config.timeout = 30
    #    config.open_timeout = 30
    #    config.url = "https://api.viadeo.com"
    #  end
    def configure(&block)
      block.call(config) if block_given?
    end

    def config
      Viadeo::Configuration.instance
    end

    def log message
      return if config.logger.nil? || message.nil?
      config.logger.debug message
    end
  end
end
