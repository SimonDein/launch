# A featured number (something unique to this exercise) is an odd number that is a multiple of 7,
# and whose digits occur exactly once each. So, for example, 49 is a featured number,
# but 98 is not (it is not odd), 97 is not (it is not a multiple of 7),
# and 133 is not (the digit 3 appears twice).

# Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument.
# Issue an error message if there is no next featured number.


# solution 1
TO_HIGH_NUM_ERROR = 'There is no possible number that fulfills those requirements.'

def featured?(num) # whether all digits in num are unique AND num is odd
  digits = num.digits
  digits.uniq == digits && num.odd?
end

def featured(num)
  remainder = 7 - (num % 7) # int that needs to be added to num to make it divisible by 7
  divisible_by_7 = num + remainder
  while featured?(divisible_by_7) == false # while the num isn't featured - add 7
    divisible_by_7 += 7
    return TO_HIGH_NUM_ERROR if divisible_by_7 > 9_876_543_210
  end
  divisible_by_7
end

# tests
puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999) # => 'There is no possible number that fulfills those requirements.'