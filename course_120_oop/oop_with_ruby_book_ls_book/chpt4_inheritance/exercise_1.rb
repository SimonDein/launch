# Create a superclass called Vehicle for your MyCar class to inherit from and move the behavior that isn't specific to the MyCar class to the superclass. 
# Create a constant in your MyCar class that stores information about the vehicle that makes it different from other types of Vehicles.

# Then create a new class called MyTruck that inherits from your superclass that also has a constant defined that separates it from the MyCar class in some way.

class Vehicle
  def self.gas_milage(litre, kilometers)
    "#{kilometers / litre}km per litre of gas"
  end

  attr_accessor :color, :model, :speed
  attr_reader :year
  
  def initialize(year, color, model)  # any subclass will inherit this initialize method
    @year = year
    self.color = color
    self.model = model

    self.speed = 0
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
  TYPE = 'truck'
end

new_car = MyCar.new(1987, 'purple', 'stingray')
new_truck = MyTruck.new(2003, 'yellow', 'super digger')
puts new_car.to_s
puts new_truck.to_s