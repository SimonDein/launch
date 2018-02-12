class Pet
  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Dog < Pet
  def speak
    'bark!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'meow'
  end
end

class BullDog < Dog
  def swim
    "I can't swim!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

puts pete.run                # => "running!"
puts pete.speak              # => NoMethodError

puts kitty.run               # => "running!"
puts kitty.speak             # => "meow!"
puts kitty.fetch             # => NoMethodError

puts dave.speak              # => "bark!"

puts bud.run                 # => "running!"
puts bud.swim                # => "can't swim!"