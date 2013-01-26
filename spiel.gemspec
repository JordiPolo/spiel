# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spiel/version'

Gem::Specification.new do |gem|
  gem.name          = "spiel"
  gem.version       = Spiel::VERSION
  gem.authors       = ["Jordi Polo Carres"]
  gem.email         = ["mumismo@gmail.com"]
  gem.description   = "Methods and utilities to help you write clean code"
  gem.summary       = "Methods inspired by functional languages to DRY, simplify and make code more beautiful"
  gem.homepage      = "https://github.com/JordiPolo/spiel"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec"
end
