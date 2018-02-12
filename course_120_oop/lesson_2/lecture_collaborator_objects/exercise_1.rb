class Person
  attr_accessor :name, :pet
  
  def initialize(n)
    @name = n
  end
end

class Dog
  def initialize(n)
    @name = n
  end

  def speak
    puts "Aaaarff!"
  end
end

john = Person.new('John')
fido = Dog.new('Fido')

john.pet = fido     # Instance variables can point to any object - including objects of custom defined classes
puts john.pet # => #<Dog:0x007ffeb414f1d0>

