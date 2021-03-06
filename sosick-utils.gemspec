# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sosick/utils/version'

Gem::Specification.new do |spec|
  spec.name          = "sosick-utils"
  spec.version       = Sosick::Utils::VERSION
  spec.authors       = ["shunsuke wada"]
  spec.email         = ["letusfly95@gmail.com"]
  spec.summary       = %q{it is a module for maintenance sosick server.}
  spec.description   = %q{1. module; update photos table by favorite table's marked for update}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_dependency 'activerecord'
  spec.add_dependency 'mysql2'
end
