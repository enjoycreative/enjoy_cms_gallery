module Enjoy::Gallery
  module Admin
    module EmbeddedImage
      def self.config(fields = {})

        if fields
          if fields.is_a?(Hash)
            fields.reverse_merge!({image: :enjoy_image})
          else
            finded = false
            fields.each { |g|
              finded = !!g[:fields][:image] unless finded
            }
            unless finded
              fields << {
                name: :image,
                fields: {
                  image: :enjoy_image
                }
              }
            end
          end
        end

        if block_given?
          Enjoy::Admin::EmbeddedElement.config(nil, fields) do |config|
            yield config
          end
        else
          Enjoy::Admin::EmbeddedElement.config(nil, fields)
        end
      end
    end
  end
end
