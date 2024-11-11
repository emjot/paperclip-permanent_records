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
  spec.homepage      = 'https://github.com/emjot/paperclip-permanent_records'
  spec.license       = 'MIT'

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/emjot/paperclip-permanent_records/issues',
    'changelog_uri'   => 'https://github.com/emjot/paperclip-permanent_records/blob/main/CHANGELOG.md',
    'homepage_uri'    => 'https://github.com/emjot/paperclip-permanent_records',
    'source_code_uri' => 'https://github.com/emjot/paperclip-permanent_records'
  }

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.0'

  spec.add_dependency 'activerecord', '>= 6.1'
  spec.add_dependency 'kt-paperclip', ['>= 7.2', '< 8']
  spec.add_dependency 'permanent_records', '>= 6.0'
end
