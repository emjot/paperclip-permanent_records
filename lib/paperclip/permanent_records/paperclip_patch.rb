# frozen_string_literal: true

# Patch for (kt-)paperclip >= 3.5.0 (based on 7.2.2)

module Paperclip
  class HasAttachedFile
    private

    # Overwrite so it doesn't add a :before_destroy filter - we want to handle that in
    # {Paperclip::PermanentRecords::ActiveRecord#destroy} instead
    def add_active_record_callbacks
      name = @name
      @klass.send(:after_save) { send(name).send(:save) }
      # @klass.send(:before_destroy) { send(name).send(:queue_all_for_delete) }
      if @klass.respond_to?(:after_commit)
        @klass.send(:after_commit, on: :destroy) do
          send(name).send(:flush_deletes)
        end
      else
        @klass.send(:after_destroy) { send(name).send(:flush_deletes) }
      end
    end
  end
end
