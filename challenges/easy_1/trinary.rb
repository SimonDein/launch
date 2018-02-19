class Trinary
  BASE = 3
  attr_reader :octal
  
  def initialize(input)
    @octal = input =~ /[^0-2]/ ? '0' : input # set @octal to 0 if input is invalid
  end
  
  def to_decimal
    octal.reverse.each_char.with_index.reduce(0) do |accumulator, (number, index)|
      accumulator + (number.to_i * (BASE ** index))
    end
  end
end