=begin
In Ruby - '==' is an instance method defined in BasicObject class.
  - Costum classes will inherit this method which checks if the receiver and argument is the same object in memory
  - Most classes implement this method differently
    - We will probably want to measure equality differently between arrays and integers fx
  - This means that calling '==' on different objects will call that objects definition of equality
=end

class Person
  attr_accessor :name
end

jon = Person.new
jon.name = 'Jon'

jon2 = Person.new
jon2.name = 'Jon'

puts jon == jon2  # => false (because the BasicObject#== checks if it is the same object in memory)
# Here we would probably want to define our own implementation of the method that would
# check equility by @name fx.