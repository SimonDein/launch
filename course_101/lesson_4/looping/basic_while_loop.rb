# Examples of the while loop paradigm where the break condition is checked first -
# opposite to the do/while, where the break condition is checked last.

# The break condition is checked first before any code is run
arr = [1, 2, 3, 4]
counter = 0

while counter >= arr.size
  puts arr[counter]
  counter += 1
end

# This basic loop uses the same looping paradigm as the other - checking the break condition before any other code is run.
loop do
  break if counter >= arr.size

  puts arr[counter]
  counter += 1
end
