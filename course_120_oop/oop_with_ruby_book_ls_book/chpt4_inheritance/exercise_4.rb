# Print to the screen your method lookup for the classes that you have created.

module Unloadable
  def unload
    "The truck is unloading"
  end
end

class Vehicle
  @@total_vehicles = 0
  
  def self.total_vehicles
    @@total_vehicles
  end
  
  def self.gas_milage(litre, kilometers)
    "#{kilometers / litre}km per litre of gas"
  end

  attr_accessor :color, :model, :speed
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    self.color = color
    self.model = model

    self.speed = 0
    @@total_vehicles += 1
  end

  def speed_up(speed)
    self.speed += speed
    puts "You push the gas and accelerate #{self.speed} km/h"
  end

  def brake(speed)
    self.speed -= speed
    puts "You push the brake and decelerate #{self.speed} km/h"
  end
  
  def info
    "Model: #{self.model}\nColor: #{self.color}\nYear: #{self.year}\nSpeed: #{self.speed}"
  end

  def spray_paint(color)
    self.color = color
    puts "You're car got a nice paintjob and is now #{self.color}!"
  end

  def to_s
    "a #{self.year}, #{self.color}, #{self.model}"
  end
end

class MyCar < Vehicle
  TYPE = 'car'
end

class MyTruck < Vehicle
  include Unloadable

  TYPE = 'truck'
end

new_car = MyCar.new(1987, 'purple', 'stingray')
new_truck = MyTruck.new(2003, 'yellow', 'long houler')

puts "----- MyCar method lookup path -----"
puts MyCar.ancestors
puts "----- MyTruck method lookup path -----"
puts MyTruck.ancestors
puts "----- Vehicle method lookup path -----"
puts Vehicle.ancestors

# ----- MyCar method lookup path -----
# MyCar
# Vehicle
# Object
# Kernel
# BasicObject
# ----- MyTruck method lookup path -----
# MyTruck
# Unloadable
# Vehicle
# Object
# Kernel
# BasicObject
# ----- Vehicle method lookup path -----
# Vehicle
# Object
# Kernel
# BasicObject