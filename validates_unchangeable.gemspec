# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validates_unchangeable/version'

Gem::Specification.new do |spec|
  spec.name          = 'validates_unchangeable'
  spec.version       = ValidatesUnchangeable::VERSION
  spec.authors       = ['Vital Ryabchinskiy']
  spec.email         = ['vital.ryabchinskiy@gmail.com']

  spec.summary       = 'Library for validating unchangeable attributes.'
  spec.description   = 'Library for validating unchangeable attributes.'
  spec.homepage      = 'https://github.com/vitalinfo/validates_unchangeable'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = Gem::Requirement.new('>= 2.4')

  spec.add_development_dependency 'activerecord', '>= 5.0', '< 7.1'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '> 0.90'
  spec.add_development_dependency 'sqlite3', '> 0'
  spec.add_dependency 'activemodel', '>= 5.0'
  spec.add_dependency 'i18n'
end
