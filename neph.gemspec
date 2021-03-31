# frozen_string_literal: true

require_relative "lib/neph/version"

Gem::Specification.new do |spec|
  spec.name = "neph"
  spec.version = Neph::VERSION
  spec.authors = ["Stefan Exner"]
  spec.email = ["stex@hey.com"]

  spec.summary = "Write a short summary, because RubyGems requires one."
  spec.homepage = "https://github.com/stex/neph"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/Stex/neph/blob/main/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-cli", "~> 0.6"
  spec.add_dependency "dry-container", "~> 0.7"
  spec.add_dependency "dry-initializer", "~> 3.0"
  spec.add_dependency "ruby-next"
  spec.add_dependency "sshkit", "~> 1.21"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "standard", "~> 1.0"
end
