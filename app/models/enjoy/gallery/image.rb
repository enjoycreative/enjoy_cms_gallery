module Enjoy::Gallery
  if Enjoy::Gallery.active_record?
    class Image < ActiveRecord::Base
    end
  end

  class Image
    include Enjoy::Gallery::Models::Image

    include Enjoy::Gallery::Decorators::Image

    rails_admin(&Enjoy::Gallery::Admin::Image.config(nil, false, rails_admin_add_fields) { |config|
      rails_admin_add_config(config)
    })
  end
end
