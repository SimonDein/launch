=begin
Description of Challenge
Write a program that will take a string of digits and give you all the possible -
consecutive number series of length n in that string.

For example, the string "01234" has the following 3-digit series:
- 012
- 123
- 234

And the following 4-digit series:
- 0123
- 1234

And if you ask for a 6-digit series from a 5-digit string, you deserve whatever you get.
=end

class Series
  attr_reader :digits
  
  def initialize(digits_string)
    @digits = digits_string
  end

  def slices(slice_size)
    # return ArgumentError if user requests slizes bigger than the size of digits
    raise ArgumentError if slice_size > digits.size
    
     series = digits.split('').map.with_index do |_, index|
      digits[index, slice_size].split('').map(&:to_i) unless index + slice_size > digits.size
    end
    series.reject{ |n| n == nil}
  end
end