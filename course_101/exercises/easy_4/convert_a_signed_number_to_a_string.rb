# In the previous exercise, you developed a method that converts non-negative numbers to strings.
# In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string representation.

CHARS = %W(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  string = ''
  loop do
    num, remainder = num.divmod(10)
    string << CHARS[remainder]
    break if num == 0 || num ==
  end
  string.reverse
end

def signed_integer_to_string(int)
  sign = ''

  result = case int <=> 0
  when -1
    integer_to_string(-(int))
  else
    integer_to_string(int)
  end
end

puts signed_integer_to_string(4321)
puts signed_integer_to_string(-123)
puts signed_integer_to_string(0)
