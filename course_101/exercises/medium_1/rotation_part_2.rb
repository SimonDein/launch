# Write a method that can rotate the last n digits of a number.

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

# solution 1
def rotate_rightmost_digits(num, count)
  digits = num.to_s.split('')
  reverse_digits = digits.pop(count)
  digits << rotate_array(reverse_digits)
  digits.join('').to_i
end

# solution 2
def rotate_rightmost_digits(num, count)
  digits = num.to_s.chars
  digits[-count..-1] = rotate_array(digits[-count..-1])
  digits.join('').to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917