require 'artoo/robot'
require_relative 'port'

class SpheroRobot < Artoo::Robot
  connection :sphero, :adaptor => :sphero
  device :sphero, :driver => :sphero

  work do
    @count = 1

    every(3.seconds) do
      sphero.set_color(@count % 2 == 0 ? :white : :blue)
      @count += 1
      sphero.roll 40, rand(360)
    end
  end
end

# SPHEROS = {"127.0.0.1:4560" => SharedVaribles.port,
#            "127.0.0.1:4561" => SharedVaribles.second_port
#          }
SPHEROS = [SharedVaribles.second_port]
robots = []
SPHEROS.each {|p|
  puts p
  robots << SpheroRobot.new(:connections => {:sphero => {:port => p}})
}

SpheroRobot.work!(robots)
