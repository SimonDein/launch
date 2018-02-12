class MyCar
  attr_accessor :color, :model, :speed
  attr_reader :year
  
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model

    @speed = 0
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

used_car = MyCar.new(1988, 'yellow', 'Mustang')

puts used_car.info
used_car.speed_up(80)
puts used_car.speed
used_car.brake(50)
puts used_car.speed

used_car.spray_paint('green')