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

desc "Start irb with viadeo as gem"
task :dev_console do
  sh "irb -I lib -rubygems -r viadeo"
end

desc "Build gem"
task :gem do
  exec('gem build viadeo.gemspec')
end

desc "clean generated files"
task :clean do
  rm_f Dir.glob('*.gem').join(" ")
  rm_rf "rdoc"
end
