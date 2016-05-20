unless defined?(Enjoy) && Enjoy.respond_to?(:orm) && [:active_record, :mongoid].include?(Enjoy.orm)
  puts "please use enjoy_cms_mongoid or enjoy_cms_activerecord"
  puts "also: please use enjoy_cms_news_mongoid or enjoy_cms_news_activerecord and not enjoy_cms_news directly"
  exit 1
end

require "enjoy/gallery/version"

# require 'enjoy_cms'

if Enjoy.mongoid?
  require 'glebtv-mongoid-paperclip'
elsif Enjoy.active_record?
  require 'paperclip'
end
require "image_optim"
require "paperclip-optimizer"

require "ack_rails_admin_jcrop"

require 'enjoy/gallery/configuration'
require 'enjoy/gallery/engine'


module Enjoy::Gallery
  class << self
    def orm
      Enjoy.orm
    end
    def mongoid?
      Enjoy::Gallery.orm == :mongoid
    end
    def active_record?
      Enjoy::Gallery.orm == :active_record
    end
    def model_namespace
      "Enjoy::Gallery::Models::#{Enjoy::Gallery.orm.to_s.camelize}"
    end
    def orm_specific(name)
      "#{model_namespace}::#{name}".constantize
    end
  end

  autoload :Admin,  'enjoy/gallery/admin'
  module Admin
    autoload :Gallery,        'enjoy/gallery/admin/gallery'
    autoload :Image,          'enjoy/gallery/admin/image'
    autoload :EmbeddedImage,  'enjoy/gallery/admin/embedded_image'
  end

  module Models
    autoload :Gallery,        'enjoy/gallery/models/gallery'
    autoload :Image,          'enjoy/gallery/models/image'
    autoload :EmbeddedImage,  'enjoy/gallery/models/embedded_image'

    module Mongoid
      autoload :Gallery,        'enjoy/gallery/models/mongoid/gallery'
      autoload :Image,          'enjoy/gallery/models/mongoid/image'
      autoload :EmbeddedImage,  'enjoy/gallery/models/mongoid/embedded_image'
    end

    module ActiveRecord
      autoload :Gallery,        'enjoy/gallery/models/active_record/gallery'
      autoload :Image,          'enjoy/gallery/models/active_record/image'
    end
  end

end
