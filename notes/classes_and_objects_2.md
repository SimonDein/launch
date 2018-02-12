## Classes and Objects II

* Classes

  * Class can have class methods:

    ```ruby
    def Dog
     # Class variable
      
      def self.total_dogs
        "A dog"
      end
    end

    Dog.what_am_i #=> "A dog" # Class methods are invoked on the class itself
    ```

    > Note that we can call a class method even without instantiating an object

  * Classes can have class variables:

    ```ruby
    class Dog
      @@total_dogs = 0 # This is a class variable
      
      def initialize
        @@total_dogs += 1 # total_dogs are incremented by one for each object created
      end
      
      def self.total_dogs
        @@total_dogs
      end
    end

    dog1, dog2 = Dog.new, Dog.new
    puts Dog.total_dogs #=> 2
    ```

* `to_s` method

  * In Ruby; the `to_s` method, comes built in to every class:

    ```ruby
    ruby puts sparky # => #<GoodDog:0x007fe542323320>
    ```

    > The `puts` method calls `to_s`  on the argument passed in, and by default the `to_s` method returns the name of the class along with the encoding of the object id. This is equivalent to `puts sparky.to_s`

    ​

  * While `puts` always call `to_s` on the argument - Ruby has another useful method called `p` which instead calling `to_s`, calls `inspect` on its argument:

    ```ruby
    p sparky         # => #<GoodDog:0x007fe54229b358 @name="Sparky", @age=28>
    ```

    > Here we can see the current state of all instance variables associated with the object - helpful for debugging.
    >
    > This is equivalent to `puts sparky.inspect`

    ​

  * Besides being automatically called when invoking puts on a argument `to_s` is also automatically called in string interpolation:

    ```ruby
    age = 23
    puts "I'm #{age} years old" #=> "I'm 23 years old"
    ```

    > Here `to_s` is automatically called age object

    ​

  * **In summary, the `to_s` method is called automatically on an object when we use it with `puts` or when used with string interpolation**

  ​



#### Quick Notes

```ruby
def Car
  def to_s # Overriding the String#to_s method provided by Ruby by default
    "A car"
  end
end


my_car = Car.new
my_car.to_s #=> "A car"
```



