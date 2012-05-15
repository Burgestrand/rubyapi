# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name          = "rubyapi"

  gem.authors       = ["Kim Burgestrand"]
  gem.email         = ["kim@burgestrand.se"]
  gem.summary       = %q{Access help to the Ruby C library from FFI}
  gem.license       = "Simplified BSD License"
  gem.homepage      = "https://github.com/Burgestrand/rubyapi"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = ["rubyapi_spec.rb"]
  gem.require_paths = ["."]
  gem.extensions    = ["extconf.rb"]
  gem.version       = "1.0.1"

  gem.add_dependency 'ffi'
end

