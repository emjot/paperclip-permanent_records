require 'paperclip/permanent_records/version'

require 'paperclip'
require 'permanent_records'
require 'paperclip/permanent_records/active_record'

module Paperclip
  module PermanentRecords
    ::ActiveRecord::Base.send :include, Paperclip::PermanentRecords::ActiveRecord

    require 'paperclip/permanent_records/paperclip_patch'
  end
end
