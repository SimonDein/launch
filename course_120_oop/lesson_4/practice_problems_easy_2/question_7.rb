# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would you need to write to test your theory?

=begin
The @@cats_count variable is a class variable. It is scoped at the class level and each time an instance of the class
is created - @@cats_count will be incremented by one. The variable basically holds track of the number of instances of
the class. If Cat had a subclass - let's say Siamese - and the class would make use of Cat's initialize method or increment it
in it's own initialize method - we could keep track of all instances of Cat and all it's subclasses.

To test my theory i will write something like this:
=end

cat1 = Cat.new('Siamese')
cat2 = Cat.new('Persian')
puts Cat.cats_count #=> 2 - total instances of Cat