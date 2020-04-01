# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "megafon_sms/version"

Gem::Specification.new do |spec|
  spec.name          = "megafon_sms"
  spec.version       = MegafonSms::VERSION
  spec.authors       = ["heckfy"]
  spec.email         = ["heckfyoz@gmail.com"]

  spec.summary       = "The library for sending sms through Megafon REST API"
  spec.description   = "The library for sending sms through Megafon REST API"
  spec.homepage      = "https://github.com/heckfy/megafon_sms"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "faraday", "~> 1.0"
  spec.add_development_dependency "faraday_middleware", "~> 1.0"
  spec.add_development_dependency "json", "~> 2.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "0.80.1"
  spec.add_development_dependency "vcr", "5.1"
end
