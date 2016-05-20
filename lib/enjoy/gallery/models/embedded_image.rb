module Enjoy::Gallery
  module Models
    module EmbeddedImage
      if Enjoy::Gallery.mongoid?
        extend ActiveSupport::Concern
        include Enjoy::Gallery::Paperclipable

        include Enjoy::Gallery.orm_specific('EmbeddedImage')

        included do
          enjoy_cms_attached_file(:image,
                    styles: lambda { |attachment| attachment.instance.image_styles }
          )
        end

        def image_jcrop_options
          {}
        end

        def image_styles
          {}
        end
      end
    end
  end
end
