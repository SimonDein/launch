# Example of the do/while looping paradigm where the break condition is checked last -
# ensuring the code inside the loop is executed at least once.

arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1

  break if counter == arr.size
end
