# Question:
# When running the following code...

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

# We get the following error...

# test.rb:9:in `<main>': undefined method `name=' for 
#<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)


# Answer:
# The reason the error is thrown is becuase the class Person don't have a setter(writer) method avaiblable.
# The solution to the problem would be to either manually define a setter(writer) method for 'name' or create an attr_writer called :name.

class Person
  attr_accessor :name # Notice the attr_reader was changed to an attr_accessor - 
                      # meaning we now have both a reader and writer accesible for :name.
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
puts bob.name #=> 'Bob'