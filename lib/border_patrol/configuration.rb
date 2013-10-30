module BorderPatrol
  class Configuration
    attr_accessor :terminate, :ignore_console

    def initialize
      @terminate = true
      @ignore_console = true
    end
  end
end
