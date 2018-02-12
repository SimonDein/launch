# Write a method that takes a positive integer or zero, and converts it to a string representation.

# solution 1
CHARS = {
  0=>"0", 1=>"1", 2=>"2", 3=>"3", 4=>"4",
  5=>"5", 6=>"6",7=>"7",8=>"8", 9=>"9"
}

def integer_to_string(int)
  divisor = 1
  string = ''

  loop do
    current_digit = int / divisor % 10
    string << CHARS[current_digit]
    divisor *= 10
    break if divisor > int
  end
  string.reverse
end

# solution 2
CHARS = %W(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  string = ''
  loop do
    num, remainder = num.divmod(10)
    string << CHARS[remainder]
    break if num == 0
  end
  string.reverse
end

puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'
