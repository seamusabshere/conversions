# -*- encoding: utf-8 -*-
require File.expand_path('../lib/conversions/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'conversions'
  s.version     = Conversions::VERSION
  s.authors     = ['Manfred Stienstra', 'Seamus Abshere', 'Derek Kastner', 'Matthew Mongeau']
  s.email       = ['seamus@abshere.net', 'dkastner@gmail.com']
  s.summary     = 'Unit conversions based on alchemist'
  s.description = 'Convert numbers from one unit to another using methods like 5.miles.to.kilometers'
  s.homepage    = 'http://github.com/seamusabshere/conversions'

  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.rdoc_options = ["--line-numbers", "--inline-source"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README",
    "TODO"
  ]

  s.add_development_dependency 'bundler', '~> 1.1.0'
  s.add_development_dependency 'rspec', '~> 2'
end
