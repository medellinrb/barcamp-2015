require 'artoo'
require_relative 'port'

connection :sphero, adaptor: :sphero, port: SharedVaribles.port
device :sphero, driver: :sphero

work do
  sphero.roll 40, 180
end
