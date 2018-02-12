# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

# solution 1
def sequence(num)
  (1..num).to_a
end

# solution 2
def sequence(num)
  arr = []
  1.upto(num) { |num| arr << num}
  arr
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]