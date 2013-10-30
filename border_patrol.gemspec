$:.push File.expand_path('../lib', __FILE__)
require 'border_patrol/version'

Gem::Specification.new do |s|
  s.name        = 'border-patrol'
  s.version     = BorderPatrol::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Leonid Beder']
  s.email       = ['leonid.beder@gmail.com']
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/lbeder/border-patrol'
  s.summary     = 'Prevents your Rails server from starting and running, while there are pending DB migrations.'
  s.description = 'Prevents your Rails server from starting and running, while there are pending DB migrations.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency     'rails', '~> 3.2'
  s.add_development_dependency 'rspec', '~> 2.14'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-debugger'
end
