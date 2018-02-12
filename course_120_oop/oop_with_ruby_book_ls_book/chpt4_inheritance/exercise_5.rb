# Move all of the methods from the MyCar class that also pertain to the MyTruck class into the Vehicle class.
# Make sure that all of your previous method calls are working when you are finished.

module Unloadable
  def unload
    "The truck is unloading"
  end
end

class Vehicle
  attr_accessor :color, :model, :speed
  attr_reader :year
  @@total_vehicles = 0

  def initialize(year, color, model)
    @year = year
    self.color = color
    self.model = model

    self.speed = 0
    @@total_vehicles += 1
  end
  
  def self.total_vehicles
    @@total_vehicles
  end
  
  def self.gas_milage(litre, kilometers)
    "#{kilometers / litre}km per litre of gas"
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