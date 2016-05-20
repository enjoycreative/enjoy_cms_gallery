class EnjoyGalleryCreateGallery < ActiveRecord::Migration
  def change
    ########### c #################
    create_table :enjoy_gallery_gallery_images do |t|
      t.integer :gallery_id
      t.integer :enjoy_gallery_imagable_id
      t.string :enjoy_gallery_imagable_type

      t.boolean :enabled, default: true, null: false

      if Enjoy::Gallery.config.localize
        t.column :name_translations, 'hstore', default: {}
      else
        t.string :name, null: false
      end

      t.attachment :image
      t.timestamps
    end

    add_index :enjoy_gallery_gallery_images, [:enabled]
    add_index :enjoy_gallery_gallery_images, [:gallery_id]
    add_index :enjoy_gallery_gallery_images, [:enjoy_gallery_imagable_id, :enjoy_gallery_imagable_type]



    ########### Galleries #################
    create_table :enjoy_gallery_gallery do |t|
      t.boolean :enabled, default: true, null: false

      if Enjoy::Gallery.config.localize
        t.column :name_translations, 'hstore', default: {}
      else
        t.string :name, null: false
      end

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.string :slug, null: false
      t.attachment :image
      t.timestamps
    end

    add_index :enjoy_gallery_galleries, :slug, unique: true
    add_index :enjoy_gallery_galleries, [:enabled, :lft]

  end
end
