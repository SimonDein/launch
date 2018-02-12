# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits.
# For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument,
# unless the argument is a double number; double numbers should be returned as-is.

def double_number?(num)
  digits = num.digits
  if digits.length.even?
    first_half = digits[0, digits.length / 2]
    second_half = digits[(digits.length / 2)..-1]

    first_half == second_half
  else false
  end
end

def twice(num)
  if double_number?(num) then num
  else num * 2
  end
end

puts twice(2) == 4
puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10