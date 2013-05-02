require "viadeo/version"

module Viadeo
  class << self
    def version_string
      "Viadeo version #{Viadeo::VERSION}"
    end
  end
end
