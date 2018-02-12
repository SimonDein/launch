module Swim
  def swimable
    "I'm swimming!"
  end
end

class Pet
end

class Fish < Pet
  include Swim
end

class Mammals < Pet
  
end

class Cat < Mammals
  
end



class Dog < Mammals
  include Swim
end

class Bulldog < Dog
end

=begin
Here is an example of multiple inheritance, but where we have a class (Fish) that introduces new
behavior (swimming) that don't make sense to implement in the Pet class itself as it's an ability
some pets might have and others not.

So the answer here could be to make use of modules. Classes can only sublclass one other class - but can implement as many modules as you want.

This makes us able to construct logically broader classes that include general behavior that pretty much any
subclass we can think off would need - but the unique behavior can be extracted to modules - and then selectively
be implemented in classes as needed - like the "Swim"-module in this example.
=end