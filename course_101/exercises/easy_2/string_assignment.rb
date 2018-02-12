name = 'Bob'
save_name = name
name.upcase!

puts name, save_name # => BOB BOB

=begin
What really happens under the hood is:
- We initiate the variable name and point it to the string 'Bob'
- We initiate the variable save_name and point it to name - that is we point it to the exact same
  space place in memory. The two variables now point to the same object (with the same object id)
- Then call the mutating method String#upcase! on the object that the name variable holds,
  and name now points to the mutated string "BOB" - but the same does saved_name as it points to the same
  space in memory i.e. the same string.
- We then print the values of the variables - and are confirmed that the string mutated are the same object
  pointed to by both variables.
=end
