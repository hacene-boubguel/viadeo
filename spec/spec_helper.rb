require 'rspec'
require 'simplecov'
require 'vcr'
require 'viadeo'
require 'logger'
Dir['./spec/support/**/*.rb'].sort.each {|f| require f}
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG
Viadeo.configure do |config|
  config.logger = nil #logger
end
