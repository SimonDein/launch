=begin
Description:

The Greek mathematician Nicomachus devised a classification scheme for natural numbers, identifying each as belonging uniquely to the categories of abundant, perfect, or deficient.
A perfect number equals the sum of its positive divisors — the pairs of numbers whose product yields the target number, excluding the number itself.
This sum is known as the Aliquot sum.

Perfect: Sum of factors == number
Abundant: Sum of factors > number
Deficient: Sum of factors < number
Examples:

6 is a perfect number because its divisors are 1, 2, 3 and 6 = 1 + 2 + 3.
28 is a perfect number because 28 = 1 + 2 + 4 + 7 + 14.
Prime numbers 7, 13, etc are deficient by the Nicomachus classification.
Write a program that can tell if a number is perfect, abundant or deficient.

Input:
  - Integer

Output:
  - String

Data-structure:
  - Input should be stored as original integer
  - An accumulator in the form of an integer can be used to sum the divisors
  - 
=end

class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0
    
    sum_of_divisors = sum_divisors(number)
    
    case
    when sum_of_divisors > number then 'abundant'
    when sum_of_divisors < number then 'deficient'
    else                               'perfect'
    end
  end

  def self.sum_divisors(number)
    (1...number).reduce(0) do |sum, divisor|
      sum += divisor if number % divisor == 0
      sum
    end
  end
end