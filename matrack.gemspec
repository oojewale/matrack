# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matrack/version'

Gem::Specification.new do |spec|
  spec.name          = "matrack"
  spec.version       = Matrack::VERSION
  spec.authors       = ["Olaide Ojewale"]
  spec.email         = ["ojewaleolaide@gmail.com"]

  spec.summary       = "A ruby MVC framework."
  spec.description   = "A ruby MVC framework implented using rack."
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["matrack"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "pry"
  spec.add_runtime_dependency "pry-nav"
  spec.add_runtime_dependency "puma"
  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "tilt"
  spec.add_runtime_dependency "sqlite3"
end
