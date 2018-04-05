# In Ruby variable scope is defined by a block
# A block is defined by do/end or {} following a method invocation.
# EXAMPLE:
arr = [1, 2, 3]

arr.each do |num| # num is a block argument
  puts num
end

arr.each { |num| puts num}
# both doing the same thing

# Scope defines where a variable is accesible
# If a variable is out of scope - it can't be accessed.
# EXAMPLE:

loop do      # Loop is a method of Kernel - unlike while, unless and for loops
  a = 5       # which are part of the ruby language and does NOT create a new variable scope
  break
end

puts a # => `<main>': undefined local variable or method `a' for main:Object (NameError)
# The variable a is defined in an inner scope not accessible to the outer <main> scope.

----------

Local variables are only accessible "inwards" - meaning any inner scope can access a variable
in the outer scope - but a variable defined in an inner scope can't be accessed from an outer scope.
In the following example we don't just access the outer scope variable - but we also re-assign it.
EXAMPLE:

a = 5

3.times do |n|    # method invocation with a block
  a = 3
  b = 5           # b is initialized in the inner scope
end

puts a  # prints 5 => nil
puts b  # scope.rb:11:in `<main>': undefined local variable or method `b' for main:Object (NameError)

