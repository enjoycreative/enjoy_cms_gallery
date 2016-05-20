module Enjoy::Gallery
  if Enjoy::Gallery.active_record?
    class Gallery < ActiveRecord::Base
    end
  end

  class Gallery
    include Enjoy::Gallery::Models::Gallery

    include Enjoy::Gallery::Decorators::Gallery

    rails_admin(&Enjoy::Gallery::Admin::Gallery.config(nil, rails_admin_add_fields) { |config|
      rails_admin_add_config(config)
    })
  end
end
