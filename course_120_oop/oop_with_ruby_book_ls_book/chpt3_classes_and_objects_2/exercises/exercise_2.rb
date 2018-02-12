# Override the to_s method to create a user friendly print out of your object.

class MyCar
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

new_car = MyCar.new(1987, 'purple', 'stingray')
puts new_car.to_s