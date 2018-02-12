=begin
If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

Answer:
By either - including the modules in each of the classes - or - creating a superclass fx.
named "Vehicle" that includes the module and Car and Truck will subclass from.

We can call the Speed::go_fast instance method on an object from either class to see if the expected string is returned.
=end

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

Car.new.go_fast
Truck.new.go_fast