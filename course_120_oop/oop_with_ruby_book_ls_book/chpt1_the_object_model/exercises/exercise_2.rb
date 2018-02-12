# Question:
# What is a module? What is its purpose? How do we use them with our classes?
# Create a module for the class you created in exercise 1 and include it properly.

=begin
Modules is used for grouping together reusable code - usually common methods.
And secondly they can be used as a namespace - fx. if you want to have several classes by the same name you can wrap it in a module that will serve as a namespace.
You can't create an object -
with a module - only implement functionality like fx. methods.

In the example below we define a "Dog" class and mixin the Bark module which provides us with the "bark method.

=end

module Bark
  def bark
    puts "ARfff!"
  end
end

class Dog
  include Bark
end

plet = Dog.new
plet.bark