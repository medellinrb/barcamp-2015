require 'artoo'
require_relative 'port'

connection :sphero, adaptor: :sphero, port: SharedVaribles.port
device :sphero, driver: :sphero

colors = [:red, :green, :yellow, :blue, :white]
position = 0

work do
  every(3.seconds) do
    color = colors[position]
    puts "Changing to color #{color}"
    sphero.set_color color
    if position == (colors.count - 1)
      position = 0
    else
      position += 1
    end
  end
end
