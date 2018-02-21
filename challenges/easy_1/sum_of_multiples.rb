=begin
Description:

Write a program that, given a number, can find the sum of all the multiples of particular numbers up to but not including that number.
If no set of numbers is given, default to 3 and 5.

Example:
If we list all the natural numbers up to but not including 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18.
The sum of these multiples is 78.

Break Down:
Input
  - The object
    - Takes 0-many arguments
    - Can only be numbers above 0
    - These will be the divisors for finding any multiples

  - The method #to(arg) takes a single integer

Output
  - An integer between 0-infinity
    - This is the sum of all multiples of the the numbers up to - but not including - the passed in integer

Datastructures
  - The constuctor should pass in an unknown number of arguments and pack to array

  - The method will take an integer which will be kept that way

Algorithm

Instatiating an SumOMfultiples object
  - Defaults to 3, 5
  - If arguments are passed to the constructor set to these instead

  - 1..(num_limit - 1).to_a.reject { any numbers not multiples of divisors }
  - return arr_of_multiples.sum
=end

require 'pry'

class SumOfMultiples
  attr_reader :divisors
  
  DEFAULT = [3, 5]
  
  def initialize(*divisors)
    @divisors = divisors
  end

  def self.to(limit, divisors = DEFAULT)
    (1...limit).select do |num|
      divisors.any? { |divisor| num % divisor == 0 }
    end.sum # return sum
  end
  
  def to(limit) # call class method if called on an instance
    self.class.to(limit, self.divisors)
  end
end
