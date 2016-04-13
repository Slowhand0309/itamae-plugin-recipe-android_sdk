# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'itamae/plugin/recipe/android_sdk/version'

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-android_sdk"
  spec.version       = Itamae::Plugin::Recipe::AndroidSdk::VERSION
  spec.authors       = ["slowhand0309"]
  spec.email         = ["slowhand0309@gmail.com"]

  spec.summary       = %q{Itamae plugin for Android SDK.}
  spec.description   = %q{Itamae plugin for Android SDK.}
  spec.homepage      = "https://github.com/Slowhand0309/itamae-plugin-recipe-android_sdk"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime Dependencies
  spec.add_runtime_dependency "itamae", "~> 1.7"

  # Development Dependencies
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
