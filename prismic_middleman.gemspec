# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prismic_middleman/version'

Gem::Specification.new do |spec|
  spec.name          = "prismic_middleman"
  spec.version       = PrismicMiddleman::VERSION
  spec.authors       = ["Eric Saupe"]
  spec.email         = ["eric@starrynightstudios.com"]
  spec.summary       = %q{An extension for Middleman to fetch data from Prismic.io API-based CMS}
  spec.description   = %q{An extension for Middleman to fetch data from Prismic.io API-based CMS}
  spec.homepage      = "https://github.com/starrynightstudios/prismic_middleman"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "prismic.io"

  spec.add_runtime_dependency 'middleman-core', ['< 4.0.0']

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
