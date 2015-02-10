require 'paperclip/permanent_records/version'

require 'paperclip'
require 'permanent_records'
require 'paperclip/permanent_records/active_record'

module Paperclip
  module PermanentRecords
    ::ActiveRecord::Base.send :include, Paperclip::PermanentRecords::ActiveRecord

    if Gem::Version.new(Paperclip::VERSION) >= Gem::Version.new('3.5.0')
      require 'paperclip/permanent_records/paperclip_patch'
    else
      require 'paperclip/permanent_records/paperclip_34_patch'
      ::ActiveRecord::Base.send :include, Paperclip::PermanentRecords::ActiveRecord::Paperclip34Compat
    end
  end
end
