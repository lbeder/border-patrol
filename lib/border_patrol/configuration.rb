module BorderPatrol
  Redis = ::Redis

  class Configuration
    attr_accessor :terminate

    def initialize
      @terminate = true
    end
  end
end
