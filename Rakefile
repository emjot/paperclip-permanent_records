# frozen_string_literal: true

require 'bundler/setup'

require 'bundler/gem_helper'
require 'paperclip/permanent_records/gem_helper'
Bundler::GemHelper.prepend(Paperclip::PermanentRecords::GemHelper)
require 'bundler/gem_tasks'

require 'appraisal'
require 'rspec/core/rake_task'
require 'wwtd/tasks'

desc 'Default: run all tests with all supported versions'
task default: :all

desc 'Run tests with all supported versions.'
task all: ['appraisal:install'] do
  exec('rake appraisal spec')
end

desc 'Run all tests'
RSpec::Core::RakeTask.new('spec') do |t|
  t.pattern = FileList['spec/**/*_spec.rb']
end
