# This will return the argument passed - incremented by 7
def add_four(num)
  num + 4
end

# This will be able to both puts AND return the value of sum.
# A "nil" would've been returned if "puts sum" had been returned, as the method "puts" always returns "nil"
def add_three(num)
  sum = num + 3
  puts sum
  sum # implicitly returns value of sum
end

# methods can be chained with other methods
# the value returned from the first will be passed on as the argument for the next - and so on

# add_four will return 7 - the method ::times will take the returned value - 7 - as it's argument
# therefore this will puts 7 times
add_four(3).times {puts "This will print 7 times"}

# we can keep chaining methods if we want to
# this will print 6 times
add_four("yo".length).times {puts "this will print 6 times"}


add_three(5) # this will print out "8" as a string and return the value as well (as an int)
