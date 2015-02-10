# Patch for paperclip < 3.5.0

module Paperclip
  module InstanceMethods
    # Overwrite with no-op so we can handle it in
    # {Paperclip::PermanentRecords::ActiveRecord#destroy} instead
    def prepare_for_destroy
      true
    end
  end
end
