# Write a method that takes one argument, a positive integer
# and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

# Further Exploration:
# Modify stringy so it takes an optional argument that defaults to 1.
# If the method is called with this argument set to 0,
# the method should return a String of alternating 0s and 1s, but starting with 0 instead of 1.

def stringy(digit_length, starting_digit = 1)
  ones_and_zeros = []
  secondary_digit = case starting_digit
  when 1
    0
  when 0
    1
  end

  digit_length.times do |index|
    index.even? ? ones_and_zeros << starting_digit : ones_and_zeros << secondary_digit
  end

  ones_and_zeros.join()
end

puts stringy(6)
puts stringy(12, 0)
puts stringy(3)
puts stringy(8, 1)
