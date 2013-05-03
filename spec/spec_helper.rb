require 'rspec'
require 'simplecov'
require 'vcr'
require 'support/vcr_setup'
require 'viadeo'
require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG
Viadeo.configure do |config|
  config.logger = logger
end
