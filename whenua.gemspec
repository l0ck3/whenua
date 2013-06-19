# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whenua/version'

Gem::Specification.new do |spec|
  spec.name          = "whenua"
  spec.version       = Whenua::VERSION
  spec.authors       = ["l0ck3"]
  spec.email         = ["yann@wengee.co"]
  spec.description   = %q{Whenua serves as a base for clean architecture in Ruby applications}
  spec.summary       = %q{It helps implementing good architecture principles}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
