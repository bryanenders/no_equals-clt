# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'no_equals/clt/version'

Gem::Specification.new do |spec|
  spec.name          = 'no_equals-clt'
  spec.version       = NoEquals::CLT::VERSION
  spec.author        = 'Bryan Enders'

  spec.summary       = 'NoEquals::CLT is a reverse Polish notation (RPN) Calculator command line tool'

  spec.required_ruby_version = '>= 2.2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = ['no-equals']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake',    '~> 10.0'
  spec.add_development_dependency 'rspec',   '~> 3.0'

  spec.add_runtime_dependency 'no_equals', '~> 0'
end
