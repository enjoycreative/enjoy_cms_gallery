module Enjoy::Gallery::Paperclipable
  extend ActiveSupport::Concern

  module ClassMethods
    def enjoy_cms_attached_file(name, opts = {})
      if Enjoy.active_record?
        include Enjoy::Gallery::ActiveRecordPaperclip
        enjoy_cms_active_record_attached_file(name, opts)

      elsif Enjoy.mongoid?
        include Enjoy::Gallery::MongoidPaperclip
        enjoy_cms_mongoid_attached_file(name, opts)
      end
    end
  end

end
