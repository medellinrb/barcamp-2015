require 'artoo'
require_relative 'port'

connection :sphero, adaptor: :sphero, port: SharedVaribles.port
device :sphero, driver: :sphero

work do
  puts "Set color to red"
  sphero.set_color :red
end
