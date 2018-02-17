# Implement octal to decimal conversion
# Given an octal input string, your program should produce a decimal output.


=begin
Input:
  - num

Output:
  - num

Data structure:
  - We have to iterate each consecutive digit in the argument passed
    - This means we can the given number into a:
      - String - or
      - An array
  
  - We can then iterate and produce a result we can turn back into an integer


Algorithm:
  - Return 0 if argument passed is invalid
  - Starting from the back
  - For each digit
  - Accumulator = 0
  - Accumulator += octal to decimal value of current digit
  - When finished return accumulator

=end


class Octal
  attr_reader :octal
  
  def initialize(input)
    input = input.to_i
    @octal = invalid_input?(input) ? 0 : input # set @octal to 0 if input is invalid
  end
  
  def to_decimal
    octal.digits.each_with_index.reduce(0) do |accumulator, (number, index)|
      accumulator + (number * (8 ** index))
    end
  end
  
  def invalid_input?(input)
    input = input
    input <= 0 || input.digits.any? { |num| num > 7} || input.to_s.to_i != input
  end
end

puts Octal.new(233).to_decimal