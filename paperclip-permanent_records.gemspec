lib = File.expand_path('../lib', __FILE__)
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

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2'

  spec.add_dependency 'activerecord', '>= 4.2'
  spec.add_dependency 'paperclip', '>= 4.1'
  spec.add_dependency 'permanent_records', '>= 4.2.7'

  spec.add_development_dependency 'appraisal', '~> 2.2'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec-rails', '~> 3.7'
  spec.add_development_dependency 'rubocop', '~> 0.51.0' # lock for now until rubocop-rspec can be updated
  spec.add_development_dependency 'rubocop-rspec', '1.5.1' # lock for now until we only use ruby > 2.1
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'wwtd', '~> 1.3'
end
