## The Object Model

- **Object Oriented Programming** is a programming paradigm that involves grouping and encapsulation of code and function.
  - Encapsulation sets boundries for "what can effect what" and basically defines confined space which makes for a safer development.
  - OOP gives us the opperturnity for **polymorphism** ("poly" - many. "morphism" - forms)
    - Using prewritten code for new porpuse - fx. using mixins and inheritance
  - OOP gives us a new layer of abstraction
    - Objects and methods are represented as real world nouns and functions - e.g. `my_cards` - `Cards#deal_cards(n)`



- **Classes** and **modules**
  - **Classes are template definitions** of methods, variables and of how to instantiate objects
    - In Ruby everything is an object - i.e. an instance of a class (an instance of a class is an object)
    - Use the `Obj#class` method to have the recieving object's class returned.
  - **Modules are groupings of common functions/methods** which can be "mixed in" to a class using the `include` keyword
    - Modules **only** provide **functions/methods** and therefore no objects can be instantiated by a module.



- **Inheritance** is used in Ruby
  - A subclass inherits from a superclass
  - Inheritance allows for more generic superclasses for large reusability and smaller subclasses for finer detailed and intricate operations.



Example of *mixing in* a **Module**:

```ruby
module Speak			# Module to be included
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak 		# Is included here
end

class HumanBeing
  include Speak			# and here
end

sparky = GoodDog.new
sparky.speak("Arf!")        # => Arf!
bob = HumanBeing.new
bob.speak("Hello!")         # => Hello!
```



Example of the **method look up path**:

```ruby
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors
```

> Gives an ouput like this:

```ruby
---GoodDog ancestors---
GoodDog #1 Checks it's own class first
Speak	#2 Then checks included modules
Object 	#3 Goes a level deeper...so on
Kernel
BasicObject

---HumanBeing ancestors---
HumanBeing
Speak
Object
Kernel
BasicObject
```

