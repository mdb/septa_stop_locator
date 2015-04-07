# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'septa_stop_locator/version'

Gem::Specification.new do |spec|
  spec.name          = 'septa_stop_locator'
  spec.version       = SeptaStopLocator::VERSION
  spec.authors       = ['Mike Ball']
  spec.email         = ['mikedball@gmail.com']
  spec.summary       = %q{Get the SEPTA stops closest to a lat/long point for a given bus/trolley route.}
  spec.description   = %q{Get the SEPTA stops closest to a lat/long point for a given bus/trolley route.}
  spec.homepage      = 'http://github.com/mdb/septa_stop_locator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'haversine', '0.3.0'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '10.4.2'
  spec.add_development_dependency 'rspec', '3.2.0'
  spec.add_development_dependency 'vcr', '2.9.3'
  spec.add_development_dependency 'webmock', '1.20.4'
end
