# frozen_string_literal: true

require_relative './lib/randpass/version'

Gem::Specification.new do |s|
  s.name        = 'randpass'
  s.version     = Randpass::VERSION
  s.summary     = 'Ruby random password generator'
  s.description = <<~DESCRIPTION
    Generate single password or list, with or without comments,
    and copy password in clipboard (or not). Password is generated with
    SecureRandom#base64 + random special characters.
  DESCRIPTION

  s.license = 'MIT'
  s.authors = 'alx3dev'
  s.homepage = 'https://github.com/alx3dev/randpass'

  s.bindir = 'bin'
  s.require_paths = 'lib'
  s.executables = 'randpass'

  s.metadata['homepage_uri'] = 'https://github.com/alx3dev/randpass'
  s.metadata['source_code_uri'] = 'https://github.com/alx3dev/randpass'
  s.metadata['bug_tracker_uri'] = "#{s.homepage}/issues"
  s.metadata['changelog_uri'] = "#{s.homepage}/changelog.md"
  s.metadata['documentation_uri'] = "https://rubydoc.info/gems/#{s.name}/#{s.version}"
  s.metadata['rubygems_mfa_required'] = 'true'

  s.files = %w[ lib/randpass.rb
                lib/randpass/version.rb
                lib/randpass/random.rb
                lib/randpass/storage.rb
                bin/options.rb
                bin/setup
                LICENSE
                README.md
                randpass.gemspec]

  s.required_ruby_version = '>= 2.6', '< 3.2'

  s.add_runtime_dependency 'clipboard', '~> 1.3'
  s.add_runtime_dependency 'optimist', '~> 3.0.1'
  
  s.add_development_dependency 'bundler', '~> 2.3'
  s.add_development_dependency 'rake', '~> 13.0'
end
