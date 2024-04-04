# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip/permanent_records/version'

Gem::Specification.new do |spec|
  spec.name          = 'paperclip-permanent_records'
  spec.version       = Paperclip::PermanentRecords::VERSION
  spec.authors       = ['Maximilian Herold']
  spec.email         = ['herold@emjot.de']
  spec.summary       = 'Make paperclip attachments work with permanent_records'
  spec.description   = 'Make paperclip attachments work with permanent_records'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://gems.emjot.de'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'activerecord', '>= 5.2'
  spec.add_dependency 'kt-paperclip', ['>= 7.2', '< 8']
  spec.add_dependency 'permanent_records', '>= 6.0'

  spec.add_development_dependency 'appraisal', '~> 2.5'
  spec.add_development_dependency 'bundler', '~> 2.4'
  spec.add_development_dependency 'rake', '>= 13.0'
  spec.add_development_dependency 'rspec-rails', '~> 5.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'rubocop-rake'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'sqlite3'
end
