class Animal # Animal is a superclass of of GoodDog and Cat
  def speak
    "Hello there!"
  end
end

class GoodDog < Animal # GoodDog is a sublclass of Animal
  attr_accessor :name
  
  def initialize(n)
    self.name = n
  end

  def speak # The GoodDog#speak method will override the one Animal#speak method
    "#{self.name} says aaarf!"
  end
end

class Cat < Animal # Cat is a subclass of Animal
  attr_accessor :name
  
  def initialize(n)
    self.name = n
  end
end

my_cat = Cat.new('Garfield')
my_dog = GoodDog.new('Fido')

puts my_cat.speak
puts my_dog.speak