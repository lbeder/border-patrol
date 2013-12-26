ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'border-patrol'

Dir['./spec/support/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.order = 'random'
end
