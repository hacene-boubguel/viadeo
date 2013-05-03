module Viadeo
  class Error < StandardError; end
  class MissingResourceError < Error; end
  class MissingAccessTokenError < Error; end
end
