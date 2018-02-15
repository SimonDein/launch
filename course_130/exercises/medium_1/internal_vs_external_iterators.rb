
my_enumerator = Enumerator.new do |arr|
  arr << 1 # takes care of factorial 0!

  accumulator = 1
  number = 1
  loop do
    accumulator = accumulator * number
    arr << accumulator # '<<' defines the elements that we can later iterate through
    number += 1
  end
end

# external iteraion
7.times { puts my_enumerator.next } # Enumerator#next will return the next "yielder" (object to be yielded)

my_enumerator.rewind

my_enumerator.each_with_index { |num, index| puts num; break if index >= 6 }

# On each iteration we want to add the factorial of current num to arr

# 