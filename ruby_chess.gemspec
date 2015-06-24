# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_chess/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_chess"
  spec.version       = RubyChess::VERSION
  spec.authors       = ["Joseph Daly"]
  spec.email         = ["josefdaly@gmail.com"]
  spec.summary       = "Joe's Chess game for ruby"
  spec.description   = "Joe's Chess game for ruby"
  spec.homepage      = "https://github.com/josefdaly/RubyChess"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["ruby_chess"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
