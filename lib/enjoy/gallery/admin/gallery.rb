module Enjoy::Gallery
  module Admin
    module Gallery
      def self.config(nav_label = nil, fields = {})
        Proc.new {
          navigation_label(nav_label || I18n.t('enjoy.gallery'))
          field :enabled, :toggle do
            searchable false
          end

          field :name, :string do
            searchable true
          end
          group :URL do
            active false
            field :slugs, :enjoy_slugs
            field :text_slug
          end

          field :image, :enjoy_image

          # field :gallery_objects do
          #   read_only true
          # end

          if defined?(RailsAdminMultipleFileUpload)
            multiple_file_upload(
                {
                    fields: [:gallery_images]
                }
            )
          end

          Enjoy::RailsAdminGroupPatch::enjoy_cms_group(self, fields)

          if block_given?
            yield self
          end
        }
      end
    end
  end
end
