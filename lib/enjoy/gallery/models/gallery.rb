module Enjoy::Gallery
  module Models
    module Gallery
      extend ActiveSupport::Concern
      include Enjoy::Model
      include ManualSlug
      include Enjoy::Enableable
      include Enjoy::Gallery::Paperclipable

      include Enjoy::Gallery.orm_specific('Gallery')

      included do
        manual_slug :name

        has_many :gallery_images, class_name: "Enjoy::Gallery::Image"
        alias :images :gallery_images

        acts_as_nested_set

        enjoy_cms_attached_file(:image)

        # has_many :connected_objects, as: :enjoy_gallerable

        after_save do
          auto_rails_admin_jcrop(:image)
        end
      end
      
    end
  end
end
