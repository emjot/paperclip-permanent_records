module Paperclip
  module PermanentRecords
    module ActiveRecord
      extend ActiveSupport::Concern

      def destroy(force = nil)
        if has_paperclip_attachments? &&                      # only when we have paperclip attachments,
          (!is_permanent? ||                                  #  if model does not support "safe deletion"
            ::PermanentRecords.should_force_destroy?(force))  #  or if model supports "safe deletion" but it is forced
          schedule_attachments_for_deletion                   # => delete the attachments
        end

        super(force)
      end

      private

      def has_paperclip_attachments?
        self.class.respond_to?(:attachment_definitions)
      end

      # (this contains what each of the before_destroy callbacks originally did)
      def schedule_attachments_for_deletion
        self.class.attachment_definitions.each { |name, _opts| send(name).send(:queue_all_for_delete) }
      end

      # Need to overwrite some of the above when working with paperclip < 3.5.0
      module Paperclip34Compat
        extend ActiveSupport::Concern

        private

        def has_paperclip_attachments?
          respond_to?(:prepare_for_destroy)
        end

        # (this contains the original {Paperclip::InstanceMethods#prepare_for_destroy} method)
        def schedule_attachments_for_deletion
          Paperclip.log("Scheduling attachments for deletion.")
          each_attachment { |_name, attachment| attachment.send(:queue_all_for_delete) }
        end
      end
    end
  end
end
