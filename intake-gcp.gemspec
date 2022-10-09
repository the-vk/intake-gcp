# frozen_string_literal: true

require_relative './lib/intake/gcp/version'

Gem::Specification.new do |spec|
  spec.name                   = 'intake-gcp'
  spec.summary                = 'GCP sink for intake'
  spec.version                = Intake::GCP::VERSION
  spec.homepage               = 'https://github.com/the-vk/intake-gcp'
  spec.authors                = ['Andrey Maraev']
  spec.email                  = ['the_vk@thevk.net']
  spec.license                = 'MIT'
  spec.required_ruby_version  = '~> 3.0'
  spec.metadata = {
    'rubygems_mfa_required' => 'true'
  }

  spec.files = Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md]

  spec.add_runtime_dependency 'intake', '~> 0.1.0'
  spec.add_runtime_dependency 'stackdriver', '~> 0.21.1'

  spec.add_development_dependency 'code-scanning-rubocop', '~> 0.6.0'
  spec.add_development_dependency 'debug', '~> 1.6.0'
  spec.add_development_dependency 'rake', '~> 13.0.0'
  spec.add_development_dependency 'rspec', '~> 3.11.0'
  spec.add_development_dependency 'rubocop', '~> 1.36.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
end
