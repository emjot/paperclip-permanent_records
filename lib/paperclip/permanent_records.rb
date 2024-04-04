# frozen_string_literal: true

require 'paperclip/permanent_records/version'

require 'paperclip'
require 'permanent_records'
require 'paperclip/permanent_records/active_record'

module Paperclip
  module PermanentRecords
    ActiveSupport.on_load(:active_record) do
      ::ActiveRecord::Base.include Paperclip::PermanentRecords::ActiveRecord
    end

    require 'paperclip/permanent_records/paperclip_patch'
  end
end
