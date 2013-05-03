# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'viadeo/version'
require 'rake'
Gem::Specification.new do |gem|
  gem.name          = "viadeo"
  gem.version       = Viadeo::VERSION
  gem.authors       = ["neceha bgl"]
  gem.email         = ["neceha.bgl@gmail.com"]
  gem.description   = %q{This gem enables you to access most features of the Viadeo GRAPH API via Ruby}
  gem.summary       = %q{The Viadeo Graph API is a simple way to bring a professional social context to websites, applications and services. Each object on Viadeo has a unique ID which can be used to call the information attached to it including any relationships or connections that exist between the objects. An object might be a member, an event or a job and connections might be professional relationships, shared articles or newsfeed comments}
  gem.homepage      = "https://github.com/neceha-bgl/viadeo"

  gem.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'spec/**/*', 'fixtures/**/*'].to_a
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'multi_json'
  gem.add_dependency 'faraday'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'
 
  gem.has_rdoc = true
end
