# frozen_string_literal: true

module Paperclip
  module PermanentRecords
    module ActiveRecord
      extend ActiveSupport::Concern

      def destroy(force = nil)
        if paperclip_attachments? && # only when we have paperclip attachments,
           (!is_permanent? || #  if model does not support "safe deletion"
             ::PermanentRecords.should_force_destroy?(force)) #  or if model supports "safe deletion" but it is forced
          schedule_attachments_for_deletion # => delete the attachments
        end

        super
      end

      private

      def paperclip_attachments?
        self.class.respond_to?(:attachment_definitions)
      end

      # (this contains what each of the before_destroy callbacks originally did)
      def schedule_attachments_for_deletion
        self.class.attachment_definitions.each_key { |name| send(name).send(:queue_all_for_delete) }
      end
    end
  end
end
