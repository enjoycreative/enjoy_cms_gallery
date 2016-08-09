module Enjoy::Gallery
  module Models
    module Mongoid
      module Gallery
        extend ActiveSupport::Concern

        included do
          field :name, type: String, localize: Enjoy::Gallery.configuration.localize

          scope :sorted, -> { order_by([:lft, :asc]) }
        end

      end
    end
  end
end
