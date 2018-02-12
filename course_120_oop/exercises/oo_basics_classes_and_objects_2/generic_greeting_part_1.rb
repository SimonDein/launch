# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

# Expected output: 
# Hello! I'm a cat!

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

=begin
Further Exploration:
What happens if you run kitty.class.generic_greeting? Can you explain this result?

Answer:
The method #class will return the class of the object on which it is invoked on.
The method chain will therefore work as the #generic_greeting method will be invoked on a class -
instead of an instance of a class.
=end