module Enjoy::Gallery
  def self.configuration
    @configuration ||= Configuration.new
  end
  def self.config
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  class Configuration

    attr_accessor :localize

    def initialize
      @can_connect_category_with_pages = Enjoy.config.localize
    end
  end
end
