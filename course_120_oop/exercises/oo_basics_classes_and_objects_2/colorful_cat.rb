=begin
Using the following code, create a class named Cat that prints a greeting when #greet is invoked. The greeting should include the name and color of the cat. Use a constant to define the color.

Expected output:
Hello! My name is Sophie and I'm a purple cat!
=end

class Cat
  COLOR = 'grey'
  
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and i'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet