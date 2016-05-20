module Enjoy::Gallery
  module Models
    module ActiveRecord
      module Gallery
        extend ActiveSupport::Concern

        included do
          has_paper_trail
          validates_lengths_from_database
          if Enjoy::Gallery.config.localize
            translates :name
          end

          scope :sorted, -> { order(lft: :asc) }
        end
      end
    end
  end
end
