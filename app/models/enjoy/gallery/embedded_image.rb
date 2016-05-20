module Enjoy::Gallery
  if Enjoy::Gallery.mongoid?
    class EmbeddedImage < Enjoy::EmbeddedElement
      include Enjoy::Gallery::Models::EmbeddedImage

      include Enjoy::Gallery::Decorators::EmbeddedImage

      # use it in inherited model
      # rails_admin &Enjoy::Gallery::Admin::EmbeddedImage.config

      # use it in rails_admin in parent model for sort
      # sort_embedded({fields: [:embedded_field_1, :embedded_field_2...]})
      # or u need to override rails_admin in inherited model to add sort field
    end
  end
end
