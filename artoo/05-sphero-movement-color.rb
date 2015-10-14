require 'artoo'
require_relative 'port'

connection :sphero, adaptor: :sphero, port: SharedVaribles.port
device :sphero, driver: :sphero

colors = [:red, :green, :yellow, :blue, :white]

work do
  every(2.seconds) do
    sphero.set_color colors.sample
    sphero.roll 40, rand(360)
  end
end
