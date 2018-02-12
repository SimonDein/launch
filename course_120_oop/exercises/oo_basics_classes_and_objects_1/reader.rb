# Using the code from the previous exercise, add a getter method named #name and invoke it in place of @name in #greet.

class Cat
  attr_reader :name
  
  def initialize(n)
    @name = n
  end

  def greet
    puts "Hello my name is #{self.name}!"
  end
end

bubbles = Cat.new('Bubbles')
bubbles.greet #=> Hello my name is Bubbles!