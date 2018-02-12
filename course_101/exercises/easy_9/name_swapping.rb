# Write a method that takes a first name, a space, and a last name passed as a single String argument,
# and returns a string that contains the last name, a comma, a space, and the first name.

# solution 1
def swap_name(string)
  string.split.reverse.join(', ')
end


puts swap_name('Joe Roberts') == 'Roberts, Joe'