=begin
Description:

Takes a string representing an octal number (base 8)
Return the base8 string as base_10 integer
(see test/octal_test.rb for example)
=end

class Octal
  BASE = 8
  attr_reader :octal
  
  def initialize(input)
    @octal = input =~ /[^0-7]/ ? '0' : input # set @octal to 0 if input is invalid
  end
  
  def to_decimal
    octal.reverse.each_char.with_index.reduce(0) do |accumulator, (number, index)|
      accumulator + (number.to_i * (BASE ** index))
    end
  end
end