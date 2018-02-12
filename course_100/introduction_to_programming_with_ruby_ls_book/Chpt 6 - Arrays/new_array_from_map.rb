# Write a program that iterates over an array and builds a new array that is the result
# of incrementing each value in the original array by a value of 2
# You should have two arrays at the end of this program, The original array and the new array you've created
# Print both arrays to the screen using the p method instead of puts

arr = [2, 4, 5, 1, 3, 1]

# Using map instead of each - as map returns a new array with the values evaluated
# Each would have returned the original array as if no operations had been evaluated
arr_incremented = arr.map {|i| i + 2}

p arr                # => [2, 4, 5, 1, 3, 1]
p arr_incremented    # => [4, 6, 7, 3, 5, 3]
