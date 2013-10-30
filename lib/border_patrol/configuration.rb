module BorderPatrol
  class Configuration
    POLLING_PERIOD = 30

    attr_accessor :terminate, :ignore_console, :polling_period

    def initialize
      @terminate = false
      @ignore_console = true
      @polling_period = 30
    end
  end
end
