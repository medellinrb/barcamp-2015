require 'artoo'
require_relative 'port'

connection :sphero, adaptor: :sphero, port: SharedVaribles.port
device :sphero, driver: :sphero

work do
  every(2.seconds) do
    sphero.roll 40, rand(360)
  end
end
