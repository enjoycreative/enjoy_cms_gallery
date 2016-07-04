if Enjoy.mongoid?
  module Enjoy::Gallery::MongoidPaperclip
    extend ActiveSupport::Concern

    include Mongoid::Paperclip

    module ClassMethods
      def enjoy_cms_mongoid_attached_file(name, opts = {})
        name = name.to_sym
        is_image = true
        unless opts.blank?
          content_type = opts.delete(:content_type)
          jcrop_options = opts.delete(:jcrop_options)
          is_image = opts.delete(:is_image)
          is_image = true if is_image.nil?
        end

        if is_image
          opts[:processors] ||= []
          opts[:processors] << :paperclip_optimizer
          opts[:processors].flatten!
          opts[:processors].uniq!

          opts[:convert_options] = {all: "-quality 75 -strip"} if opts[:convert_options].blank?
        end

        has_mongoid_attached_file name, opts
        # validates_attachment name, content_type: content_type unless content_type.blank?
        validates_attachment_content_type name, content_type: /\Aimage\/.*\Z/ if is_image
        class_eval <<-EVAL
          def #{name}_file_name=(val)
            return self[:#{name}_file_name] = ""  if val == ""
            return self[:#{name}_file_name] = nil if val == nil
            val = val.to_s
            extension = File.extname(val)[1..-1]
            file_name = val[0..val.size-extension.size-1]
            self[:#{name}_file_name] = "\#{file_name.filename_to_slug}.\#{extension.filename_to_slug}"
          end

          before_#{name}_post_process do
            p_o = self.#{name}.processors.delete :paperclip_optimizer
            self.#{name}.processors << p_o if p_o
            true
          end
        EVAL
        jcrop_options ||= {}
        if jcrop_options
          class_eval <<-EVAL
            def #{name}_jcrop_options
              #{jcrop_options}
            end
          EVAL
        end
      end
    end
  end
end
