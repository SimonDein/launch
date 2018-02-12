
# the method takes a number as argument
# the number is compared through a loop to certain thresholds based on the "modern" roman numeral system
# if the number fits the comparison:
  # - the letter corrisponding to the comparison will be added to the roman_num array
  # - the value the letter corrisponds to will be subtracted from our "num" variable

# this way the loop will keep looping over our number decrementing it while adding the equivilant letter to the array

# the method returns the roman letters as a string

def roman_numeral num
  roman_num = []        # array for holding our roman numerals

  while num > 0
    if num >= 1000
      roman_num << 'M'
      num -= 1000

    elsif num > 900
      roman_num << 'CM'
      num -= 900

    elsif num >= 500
      roman_num << 'D'
      num -= 500

    elsif num > 400
      roman_num << 'CD'
      num -= 400

    elsif num > 100
      roman_num << 'C'
      num -= 100

    elsif num > 90
      roman_num << 'XC'
      num -= 90

    elsif num > 50
      roman_num << 'L'
      num -= 50

    elsif num > 40
      roman_num << 'XL'
      num -= 40

    elsif num > 10
      roman_num << 'X'
      num -= 10

    elsif num == 9
      roman_num << 'IX'
      num -= 9

    elsif num > 5
      roman_num << 'V'
      num -= 5

    elsif num == 4
      roman_num << 'IV'
      num -= 4

    elsif num >= 1
      roman_num << 'I'
      num -= 1
    end
  end

  return roman_num.join('') # return the joined roman numerals in our array (collecting the letters)
end

puts roman_numeral(1594)
puts roman_numeral(97)
puts roman_numeral(321)
