require 'pry'
=begin
Description Of The Problem:

Write a program that will take a string of digits and give you all the possible consecutive number series of length n in that string.

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
    
    number_of_slices = digits.size - slice_size # the num of slices we can cut
    slices = []
    0.upto(number_of_slices) do |index|
      # cut slice, split slice and turn split slices into slices of integers
      slice = digits[index, slice_size].split('').map(&:to_i)
      slices << slice # add slice to array
    end
    slices
  end
end