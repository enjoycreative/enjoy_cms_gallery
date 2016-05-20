require 'rails/generators'

module Enjoy::Gallery::Models
  class EmbeddedImageGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    argument :class_name, type: :string
    argument :parent_class_name, type: :string

    desc 'Enjoy::Gallery EmbeddedImage Model generator'
    def embedded_image
      template 'embedded_image.erb', "app/models/#{file_name}.rb"
    end

    private
    def capitalized_class_name
      class_name.capitalize
    end

    def camelcased_class_name
      class_name.camelcase
    end

    def file_name
      underscored_class_name
    end

    def underscored_class_name
      camelcased_class_name.underscore
    end

    def underscored_pluralized_class_name
      underscored_class_name.pluralize
    end


    def underscored_parent_class_name
      parent_class_name.underscore
    end

    def camelcased_parent_class_name
      parent_class_name.camelcase
    end

    def parent_class_name
      parent_class_name_arg.blank? ? "SetParentClassForEmbeddedImage" : parent_class_name_arg
    end
  end
end
