# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'pathname'
require 'fileutils'

ROOT = Pathname(File.expand_path(File.join(File.dirname(__FILE__), '..')))
TEST_ASSETS_PATH = Pathname.new(ROOT).join('tmp', 'public')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.profile_examples = 2
  config.order = :random
  Kernel.srand config.seed

  config.before(:suite) do
    FileUtils.rm_rf PROCESS_ASSETS_PATH
  end

  config.after(:suite) do
    FileUtils.rm_rf PROCESS_ASSETS_PATH
  end
end

require 'active_record'
require 'active_support'
require 'paperclip/permanent_records'

ActiveRecord::Base.include Paperclip::Glue

# Falls back to the current process's pid (rather than a constant) so that
# concurrently-running rspec processes never compute identical attachment
# paths and race each other in kt-paperclip's filesystem storage adapter.
TEST_ENV_NUMBER = ENV['TEST_ENV_NUMBER'].presence || Process.pid.to_s

# TEST_ASSETS_PATH is shared across all rspec processes (it's not scoped by
# TEST_ENV_NUMBER), so cleaning it up wholesale would race with any other
# rspec process concurrently writing under it. Only ever clean up this
# process's own subtree (referenced by the before(:suite)/after(:suite)
# hooks configured above).
PROCESS_ASSETS_PATH = TEST_ASSETS_PATH.join('system', TEST_ENV_NUMBER)

Paperclip.interpolates(:test_env_number) { |_, _| TEST_ENV_NUMBER }

# set up models
require 'logger'
tmpdir = File.join(File.dirname(__FILE__), '../tmp')
FileUtils.mkdir_p(tmpdir)
log = File.expand_path(File.join(tmpdir, 'permanent_records_test.log'))
FileUtils.touch(log) unless File.exist?(log)
ActiveRecord::Base.logger = Logger.new(log)
ActiveRecord::LogSubscriber.attach_to(:active_record)
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
require File.expand_path('data/schema', __dir__)
require File.expand_path('data/models', __dir__)
I18n.locale = I18n.default_locale = :en
