# frozen_string_literal: true

require 'spec_helper'

# rubocop:disable RSpec/DescribeClass -- describing upstream kt-paperclip source, not a class in this gem
RSpec.describe 'kt-paperclip HasAttachedFile#add_active_record_callbacks (upstream source)' do
  # lib/paperclip/permanent_records/paperclip_patch.rb fully re-implements
  # Paperclip::HasAttachedFile#add_active_record_callbacks instead of calling
  # super, so it silently stops tracking upstream if that method ever changes
  # shape. This spec reads the actually-installed kt-paperclip source directly
  # off disk and fails loudly if it no longer matches what our override
  # assumes, so drift gets caught here instead of via a subtle production bug.
  let(:upstream_source) do
    gem_path = Gem.loaded_specs.fetch('kt-paperclip').full_gem_path
    file = File.join(gem_path, 'lib', 'paperclip', 'has_attached_file.rb')
    method_source = File.read(file)[/def add_active_record_callbacks.*?\n  end/m]
    method_source || raise("could not locate add_active_record_callbacks in #{file}")
  end

  it 'still registers an after_save callback that saves the attachment' do
    expect(upstream_source).to match(/after_save\).*\bsave\b/)
  end

  it 'still registers a before_destroy callback that queues the attachment for deletion' do
    expect(upstream_source).to match(/before_destroy\).*queue_all_for_delete/)
  end

  it 'still branches on after_commit support to flush queued deletes' do
    expect(upstream_source).to include('respond_to?(:after_commit)')
    expect(upstream_source).to match(/after_commit,\s*on:\s*:destroy/)
    expect(upstream_source).to match(/after_destroy\).*flush_deletes/)
    expect(upstream_source).to include('flush_deletes')
  end
end
# rubocop:enable RSpec/DescribeClass
