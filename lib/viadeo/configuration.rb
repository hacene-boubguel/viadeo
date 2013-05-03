require "singleton"
module Viadeo
  class Configuration
    include Singleton

    DEFAULT_CONFIG = {timeout: 30, open_timeout: 30, url: 'https://api.viadeo.com'}
    attr_accessor :logger, :timeout, :open_timeout, :url

    def timeout
      @timeout ||= DEFAULT_CONFIG[:timeout]
    end

    def open_timeout
      @open_timeout ||= DEFAULT_CONFIG[:open_timeout]
    end

    def url 
      @url ||= DEFAULT_CONFIG[:url]
    end
  end
end
