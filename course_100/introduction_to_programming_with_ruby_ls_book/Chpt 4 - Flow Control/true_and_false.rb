# Notice that after if and elsif we have to put an expression that evaluates to a boolean value: true or false
# In Ruby, every expression evalutates to true when used in flow control - except false and nil
# This means that anything we set as a condition that doesn't evaluate to false or nil - will be true



# // Example 1 //
# ANYTHING we set "a" to - that is NOT nil OR false - will be TRUE
# We can set a = 0 or a = "" - and a will still be evaluated as true
# If we set a = false or a = nil - it will be evaluated as false

a = ""

if a
  puts "How can this be true?"
else
  puts "This is false"
end # => How can this be true?


# // Example 2 //
# We can even assign the variable directly in the conditional
# !Note - we don't compare a to 3 ('==') - we assign it - and THAT evaluates to "true"
# !This is not optimal, as the assignment ('=') and compare ('==') operators look very similar

if a = 3
  puts "This is true"
else
  puts "This is false"
end # => This is true
