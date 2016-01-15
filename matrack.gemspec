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
  spec.homepage      = "https://github.com/andela-oojewale/matrack/blob/master/matrack-0.1.0.gem"
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
  spec.add_development_dependency "capybara", "2.5.0"
  spec.add_runtime_dependency "rspec", "3.4.0"
  spec.add_runtime_dependency "pry", "0.10.3"
  spec.add_runtime_dependency "pry-nav", "0.2.4"
  spec.add_runtime_dependency "puma", "2.15.3"
  spec.add_runtime_dependency "rack", "1.6.4"
  spec.add_runtime_dependency "tilt", "2.0.1"
  spec.add_runtime_dependency "sqlite3", "1.3.11"
  spec.add_runtime_dependency "thor", "0.19.1"
end
