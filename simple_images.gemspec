# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_images/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_images"
  spec.version       = SimpleImages::VERSION
  spec.authors       = ["Kainage"]
  spec.email         = ["kainage@gmail.com"]
  spec.description   = %q{Add a simple image attaching functionality to an Active Record model}
  spec.summary       = %q{Add a simple image attaching functionality to an Active Record model}
  spec.homepage      = "https://github.com/kainage/simple_images"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0.0"
  spec.add_dependency "sass-rails", ">= 4.0.0"
  spec.add_dependency "coffee-rails", ">= 4.0.0"
  spec.add_dependency 'rack-cache', '~> 1.2'
  spec.add_dependency 'dragonfly', '~> 0.9.15'
  spec.add_dependency 'jquery-rails', '~> 3.0.4'
  spec.add_dependency 'jquery.fileupload-rails', '~> 1.6.1'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "factory_girl_rails"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "shoulda-matchers"
end
