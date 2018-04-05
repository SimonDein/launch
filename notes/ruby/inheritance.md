# Inheritance

- Inheritance

  - Class inheritance is defined by the `<` operator:

    ```ruby
    class Animal
      include SomeRandomModule
    end

    class Mammal < Animal # mammal is now a subclass of Animal and inherits all it's methods 						including any modules mixed in to it (SomeRandomModule)
    end
    ```

  - **Every class created** will inherently subclass from  **`BasicObject` **and therefore also inherit all it's public instance methods

- Method look up path

  - The method look up path of an object can be exposed by calling `my_object.ancestors` and the path that method look up takes will look like this:

    1. Checks the class of the object it was invoked on
    2. Checks included modules (if there are any)
    3. Checks superclass
    4. Checks any modules of the superclass (if there are any)
    5. …continuing until the method is found or a `NoMethodError`  will be trown if none is found

  - The order in which modules are included makes a difference

    - If a class has two modules mixed in providing a method by the same name - the last module included will be looked up first and therefore that method in that module will be invoked:

      ```ruby
      module Swimable
        def swim
          "swimming"
        end
      end

      module Transportable
        def swim				# This instance method is invoked and Swimable's module is 							  never looked up because a method by the name was found
          "also swimming"
        end
      end

      class Animal
        include Swimable
        include Transportable # The last included module will be looked up first
      end

      an_animal = Animal.new
      an_animal.swim #=> "also swimming"
      ```

      ​

### Overview

```ruby
class Animal # Superclass to Dog and Cat
  def speak
    "hello"
  end
end

class Dog < Animal # Dog is a subclass of Animal and inherits from the superclass Animal
end

class Cat < Animal
  def speak
    "Meow"
  end
end

fido = Dog.new
snowball = Cat.new
puts fido.speak		#=> "Hello"
puts snowball.speak	#=> "Meow" (the Cat#speak method overrides the inherited Animal#speak method)
```



