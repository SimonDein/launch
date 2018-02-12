#  In this exercise, you're going to extend that method to work with signed numbers.
# Write a method that takes a String of digits, and returns the appropriate number as an integer.

# solution 1
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def get_sym(str)
  case str[0]
  when '+' then 'plus'
  when '-' then 'minus'
  else 'plus'
  end
end

def get_num(str)
  case str[0]
  when '-' then str[1, str.length]
  when '+' then str[1, str.length]
  else str
  end
end

def string_to_integer(str, sym)
  integer = 0

  case sym
  when 'plus'
    str.chars.each { |digit| integer = (integer* 10) + DIGITS[digit]}
  when 'minus'
    str.chars.each { |digit| integer = (integer* 10) - DIGITS[digit]}
  end
  integer
end

def string_to_signed_integer(signed_str)
  sym = get_sym(signed_str)
  str = get_num(signed_str)
  string_to_integer(str, sym)
end

# solution 2
def string_to_signed_integer(str)
  case str[0]
  when '+' then string_to_integer[1..-1]
  when '-' then -string_to_integer[1..-1]
  else string_to_integer[(str)
  end
end

# Further Exploration

puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
