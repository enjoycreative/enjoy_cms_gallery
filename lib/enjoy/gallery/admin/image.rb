module Enjoy::Gallery
  module Admin
    module Image
      def self.config(nav_label = nil, without_gallery = false, fields = {})
        Proc.new {
          navigation_label(nav_label || I18n.t('enjoy.gallery'))
          field :enabled, :toggle do
            searchable false
          end
          unless without_gallery
            field :gallery do
              searchable :name
            end
          end
          field :name, :string do
            searchable true
          end
          field :image, :jcrop do
            jcrop_options :image_jcrop_options
          end

          nested_set({max_depth: 1, scopes: []})

          Enjoy::RailsAdminGroupPatch::enjoy_cms_group(self, fields)

          if block_given?
            yield self
          end
        }
      end
    end
  end
end
