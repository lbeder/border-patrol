ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'pry'
require 'pry-debugger'
require 'border-patrol'

Dir['./spec/support/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.order = 'random'
end
