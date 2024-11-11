# frozen_string_literal: true

module Paperclip
  module PermanentRecords
    # Patches Bundler::GemHelper to change version tagging without the "v" Prefix, just the plain version
    # (also ignores any GemHelper.tag_prefix if you would set it!).
    #
    # Based on bundler v2.5.23
    module GemHelper
      protected

      def version_tag
        version.to_s
      end
    end
  end
end
