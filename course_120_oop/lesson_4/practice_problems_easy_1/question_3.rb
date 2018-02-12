=begin
In the last question we had a module called Speed which contained a go_fast method. We included this module in the Car class as shown below.

When we called the go_fast method from an instance of the Car class (as shown below) you might have noticed that the string printed when we go fast includes the name of the type of vehicle we are using. How is this done?

Answer:
The method lookup path will first look through the Car class where it doesn't find a match.
Then it looks at any included modules - here the Speed module - which exposes the method.

The string contains an interpolation which contains a method invocation on self.
Self in a method description refers to the calling object,
meaning that our Car object is returned.
Then Object#class is invoked on the object returning the class which is then interpolated into the string.
=end
I am a Car and going super fast!

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

small_car = Car.new
small_car.go_fast #=> I am a Car and going super fast!