=begin
 - the == operator compares two objects' values, and is frequently used.
 - the == operator is actually a method.
  - Most built-in Ruby classes, like Array, String, Fixnum, etc override the == method to specify how to compare objects of those classes.
 - if you need to compare custom objects, you should override the == method.
=end

class Person
  attr_accessor :name

  def ==(other)
    self.name == other.name
  end
end

bob = Person.new
bob.name = 'bob'

bob2 = Person.new
bob2.name = 'bob'

puts bob == bob2