=begin
Description:

The Romans wrote numbers using letters - I, V, X, L, C, D, M. (notice these letters have lots of straight lines and are hence easy to hack into stone tablets).

 1  => I
10  => X
 7  => VII
There is no need to be able to convert numbers larger than about 3000.
(The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990.
In Roman numerals 1990 is MCMXC:

1000=M
900=CM
90=XC
2008 is written as MMVIII:

2000=MM
8=VIII

=end


class Integer
  ROMAN_VALUES = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }
  
  def to_roman
    number = self
    roman_number = ''

    ROMAN_VALUES.each do |roman_digit, value|
      number_of_characters = number / value
      roman_number += roman_digit * number_of_characters
      number -= number_of_characters * value
    end
    roman_number
  end
end