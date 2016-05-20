module Enjoy::Gallery::Gallerable
  extend ActiveSupport::Concern

  module ClassMethods
    def enjoy_gallerable_field(name = :enjoy_gallerable, opts = {})
      class_name = opts.delete(:class_name)
      class_name ||= "Enjoy::Gallery::Gallery"

      belongs_to name, polymorphic: true

      class_eval <<-EVAL
        before_save do
          self.#{name}_id = nil   if self.#{name}_type.nil?
          self.#{name}_type = nil if self.#{name}_id.nil?
          self
        end
      EVAL

    end
  end

end
