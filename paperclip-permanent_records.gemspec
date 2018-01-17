# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip/permanent_records/version'

Gem::Specification.new do |spec|
  spec.name          = 'paperclip-permanent_records'
  spec.version       = Paperclip::PermanentRecords::VERSION
  spec.authors       = ['Maximilian Herold']
  spec.email         = ['herold@emjot.de']
  spec.summary       = %q{Make paperclip attachments work with permanent_records}
  spec.description   = %q{Make paperclip attachments work with permanent_records}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'paperclip', '>= 4.0'
  spec.add_runtime_dependency 'permanent_records', '~> 3.3.0'
  spec.add_runtime_dependency 'activerecord', '>= 4.0', '< 5'

  spec.add_development_dependency 'appraisal', '~> 2.2'
  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', "~> 10.0"
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'wwtd', '~> 1.3'
end
