module Enjoy::Gallery
  module Models
    module EmbeddedImage
      if Enjoy::Gallery.mongoid?
        extend ActiveSupport::Concern
        include Enjoy::Gallery::Paperclipable

        include Enjoy::Gallery.orm_specific('EmbeddedImage')

        included do
          enjoy_cms_attached_file(:image)

          after_save do
            auto_rails_admin_jcrop(:image)
          end
        end
        
      end
    end
  end
end
