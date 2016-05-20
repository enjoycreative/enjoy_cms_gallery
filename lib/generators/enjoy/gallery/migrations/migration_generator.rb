require 'rails/generators'
require 'rails/generators/active_record'

module Enjoy::Gallery
  class MigrationGenerator < Rails::Generators::Base
    include ActiveRecord::Generators::Migration
    source_root File.expand_path('../templates/migrations', __FILE__)

    desc 'Enjoy Gallery migration generator'
    def migration
      if Enjoy.active_record?
        %w(gallery).each do |table_name|
          migration_template "migration_#{table_name}.rb", "db/migrate/enjoy_gallery_create_#{table_name}.rb"
        end
      end
    end
  end
end
