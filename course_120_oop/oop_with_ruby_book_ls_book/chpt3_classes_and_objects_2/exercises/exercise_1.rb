# Add a class method to your MyCar class that calculates the gas mileage of any car.

class MyCar
  def self.gas_milage(litre, kilometers)
    "#{kilometers / litre}km per litre of gas"
  end
  
  attr_accessor :color, :model, :speed
  attr_reader :year
  
  def initialize(year, color, model)
    self.year = year
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
end

puts MyCar.gas_milage(5, 134) # => 26km per litre of gas