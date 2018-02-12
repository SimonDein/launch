# Write a method called age that calls a private method to calculate the age of the vehicle.
# Make sure the private method is not available from outside of the class.
# You'll need to use Ruby's built-in Time class to help.

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
  
  def age
    "The vehicle: #{self.to_s} is #{years_old} years old" # Public method just returns the info$
  end

  private # ---------------------- PRIVATE

  def years_old                                           # Private method does the calculating of age
    Time.now.year - Time.new(self.year).year
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
puts new_car.age    # => The vehicle: a 1987, purple, stingray is 30 years old
puts new_truck.age  # => The vehicle: a 2003, yellow, long houler is 14 years old