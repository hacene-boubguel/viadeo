require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  require 'viadeo/version'
  rdoc.title = "viadeo #{ Viadeo::VERSION }"
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
  rdoc.rdoc_dir = 'rdoc'
  rdoc.main = 'README.md'
end

