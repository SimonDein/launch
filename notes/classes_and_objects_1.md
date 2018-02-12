## Classes and Objects I

* Class
  * State
    * **instance variables keep track of state**
      1. Instance variables are unique to each instance of a class.
  * Behavior
    * **Instance methods expose behavior** for objects
      1. Methods are **shared** over a class.
      2. Methods are either **defined by the class, a superclass or included from a module**.



* Every time a new object is created the `NewObjClass#initialize` instance method (also called the "**constructer**") is called (where NewObjClass is the class of the newly created object)

  * Usually some initial instance variables are set to some starting values like fx. `@age` or `@name`

* Ruby has a built a built in way of creating reader/writer methods - the `attr_accessor` method

  * `attr_reader` creates only a reader method
  * `attr_writer` creates only a writer method
  * `attr_accessor` creates both

*  `self`  in a class definition can refer to two  things:

  1. The object on which the instance method was invoked

     ```ruby
     class MyClass
       attr_accessor :name
       
       def initialize(n) 
         self.name = n	# self refers the object on which this method is invoked
       end
     end

     person = MyClass.new('Steve')
     puts person.name #=> Steve
     ```

  2. The class itselft

     ```ruby
     class MyClass
       @@instances_of_this_class = 0
       
       def initialize
         @@instances_of_this_class += 1
       end
       
       def self.total_instances
         @@instances_of_this_class
       end
     end

     person = MyClass.new
     person2 = MyClass.new

     puts MyClass.total_instances #=> 2 (we call the MyClass#total_instances directly on the class - not an instance of the class)
     ```

     ​



#### Quick Notes

```ruby
@var 			# instance_variable
@@another_var 	# class_variable
VAR				# constant

module JustAModule # Module definition
  def Speak				# Instance method definition
    'Hello there'
  end
end
 
class MyClass 	# Class definition
  include Speak			# Module mixin
  
  def self.who_am_i 	# Class method definition
  end
  
  def initialize(n)		# Initialize method (called on instantiation of new a new obj)
    @name = n
  end
  
  def swim 				# Instance method definition
  end
end


```



