# Mutating method vs. non mutating method

# initiated array of numbers
array = [1, 2, 3, 4, 5, 6]

# Defining a "destructive" method (i.e. mutating the caller)
# This will take an array as an argument and pop and return the last item in it
def mutate(arr)
  arr.pop # => 6
end

# Defining a "non destructive" method (i.e. not mutating the caller)
# This will take an array as an argument, select objects from the conditions specified in the block
# and return a NEW ARRAY with the objects "selected"
def non_mutate(arr)
  arr.select {|i| i > 3} # => 4, 5
end

# Destructive - pops the last item 6
mutate(array)

# Non destructive - selects 4, 5
non_mutate(array)

# Shows 6 was removed - but nothing else happened to the original array
p array
