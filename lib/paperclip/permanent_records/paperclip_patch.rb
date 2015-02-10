# Patch for paperclip >= 3.5.0

module Paperclip
  class HasAttachedFile
    private

    # Overwrite so it doesn't add a :before_destroy filter - we want to handle that in
    # {Paperclip::PermanentRecords::ActiveRecord#destroy} instead
    def add_active_record_callbacks
      name = @name
      @klass.send(:after_save) { send(name).send(:save) }
      #@klass.send(:before_destroy) { send(name).send(:queue_all_for_delete) }
      @klass.send(:after_commit, :on => :destroy) { send(name).send(:flush_deletes) }
    end
  end
end
