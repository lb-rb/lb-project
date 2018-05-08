# frozen_string_literal: true
# encoding: utf-8

require File.expand_path('../lib/lb/project/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'lb-project'
  gem.version     = LB::Project::VERSION.dup
  gem.authors     = ['Firas Zaidan']
  gem.email       = ['firas@zaidan.de']
  gem.description = 'Static site builder with easy migration to dynamic site'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/lb-rb/lb-project'
  gem.license     = 'MIT'

  gem.bindir                = 'bin'
  gem.require_paths         = %w[lib bin]
  gem.files                 = `git ls-files`
                              .split($INPUT_RECORD_SEPARATOR)
  gem.executables           = `git ls-files -- bin/*`
                              .split("\n").map { |f| File.basename(f) }
  gem.test_files            = `git ls-files -- spec`
                              .split($INPUT_RECORD_SEPARATOR)
  gem.extra_rdoc_files      = %w[README.md]
  gem.required_ruby_version = '>= 2.5'

  gem.add_dependency 'dry-initializer',  '~> 2.4'
  gem.add_dependency 'dry-struct',       '~> 0.5'
  gem.add_dependency 'dry-types',        '~> 0.13'
  gem.add_dependency 'dry-view',         '~> 0.5'
  gem.add_dependency 'roda',             '~> 3.7'
  gem.add_dependency 'roda-i18n',        '~> 0.4'

  gem.add_development_dependency 'devtools',       '~> 0.1.19'
  gem.add_development_dependency 'guard',          '~> 2.14'
  gem.add_development_dependency 'guard-bundler',  '~> 2.1'
  gem.add_development_dependency 'guard-rspec',    '~> 4.7', '>= 4.7.3'
  gem.add_development_dependency 'guard-rubocop',  '~> 1.3'
  gem.add_development_dependency 'rubocop',        '~> 0.52'
  gem.add_development_dependency 'slim',           '~> 3.0'
end
