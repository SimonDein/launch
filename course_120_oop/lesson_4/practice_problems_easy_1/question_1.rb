# Which of the following are objects in Ruby? If they are objects, how can you find out what class they belong to?

# Answer:
# All of the following are instances of a class in ruby - therfore also an object
# We can call the Object#class method - inherited by all classes in Ruby -
# on any object to have the Class of the object returned.

puts true.class #=> TrueClass
puts "hello".class #=> String
puts [1, 2, 3, "happy days"].class #=> Array
puts 142.class #=> Integer