require 'rails/generators'

module Enjoy::Gallery
  class ConfigGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    desc 'Enjoy::Gallery Config generator'
    def config
      template 'enjoy_gallery.erb', "config/initializers/enjoy_gallery.rb"
    end

  end
end
