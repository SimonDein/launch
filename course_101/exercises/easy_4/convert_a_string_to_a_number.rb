# solution 1
def string_to_integer(str)
  number = 0
  for num in str.chars
    digit = case num
    when '0' then 0
    when '1' then 1
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    else 9
    end
    number = (number * 10) + digit
  end
  number '1' => 1}
end

# solution 2
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(str)
  integer = 0
  str.chars.each { |digit| integer = (integer* 10) + DIGITS[digit]}
  integer
end

puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570


# Further exploration
# Write a hexadecimal_to_integer method that converts a string representing a hexadecimal number to its integer value.

HEX_VALUES = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
}

def hexadecimal_to_integer(hex_num)
  hex_to_values = hex_num.chars.map { |digit| HEX_VALUES[digit.upcase]}

  result = 0
  power = 0
  hex_to_values.reverse.each do |current_digit|
    result = result + (current_digit * (16**power))
    power += 1
  end
  result
end

puts hexadecimal_to_integer('4D9f') == 19871
