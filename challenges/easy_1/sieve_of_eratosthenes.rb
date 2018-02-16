# Sieve takes an integer n
# Then generates and array of Number objects (costum class) for each number in range
# Each Number has two attributes - a value (the number) and whether it's marked or not
class Sieve
  attr_reader :limit, :numbers
  
  def initialize(limit)
    @numbers = (2..limit).to_a.map { |num| Number.new(num) }
  end

  def primes
    mark_composites!
    return_primes
  end

  def mark_composites!
    numbers.each_with_index do |number, index|
      loop do
        index += number.value
        break if index + 1 > numbers.size
        numbers[index].mark!
      end
    end
  end

  def return_primes()
    numbers.select { |number| number.marked? == false}.map { |number| number.value}
  end
end

# An instance of this custom Number class will contain:
# - number it represents
# - a boolean representing whether it's marked or not
class Number
  attr_reader :value
  
  def initialize(value)
    @value = value
    @marked = false
  end

  def marked?
    @marked
  end

  def mark!
    @marked = true
  end
end