module Enjoy::Gallery
  module Models
    module Mongoid
      module Gallery
        extend ActiveSupport::Concern

        included do
          if defined?(RailsAdminComments)
            include RailsAdminComments::Commentable
          end
          field :name, type: String, localize: Enjoy::Gallery.configuration.localize

          scope :sorted, -> { order_by([:lft, :asc]) }
        end

      end
    end
  end
end
