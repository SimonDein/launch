class Sieve
  def initialize(limit)
    raise ArgumentError if limit < 2
    @numbers = (2..limit).to_a
  end

  def primes
    @numbers.each do |num| # cycle through each element
      # reject any num in @numbers if it's not a prime and not the number that we're currently cycling
      @numbers.reject! { |entry| (entry != num) && entry % num == 0 }
    end
  end
end