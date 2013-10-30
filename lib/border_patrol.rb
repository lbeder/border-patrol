module BorderPatrol
  extend self

  attr_accessor :configuration

  def configure
    self.configuration ||= Configuration.new

    yield configuration
  end
end

BorderPatrol.configure {}
