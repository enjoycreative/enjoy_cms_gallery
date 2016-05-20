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
