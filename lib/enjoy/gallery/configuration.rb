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
      @localize = Enjoy.config.localize
    end
  end
end
