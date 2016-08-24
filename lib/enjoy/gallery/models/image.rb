module Enjoy::Gallery
  module Models
    module Image
      extend ActiveSupport::Concern
      include Enjoy::Model
      include Enjoy::Enableable
      include Enjoy::Gallery::Paperclipable

      include Enjoy::Gallery.orm_specific('Image')

      included do
        belongs_to :gallery, class_name: "Enjoy::Gallery::Gallery"

        acts_as_nested_set

        enjoy_cms_attached_file(:image)

        after_save do
          auto_rails_admin_jcrop(:image)
        end
      end
      
    end
  end
end
