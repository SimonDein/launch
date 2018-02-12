=begin
Write a method called one? that behaves similarly for Arrays. It should take an Array as an argument, and a block. It should return true if the block returns true for exactly one of the element values. Otherwise, it should return false.

Your method should stop processing elements of the Array as soon as the block returns true a second time.

If the Array is empty, one? should return false, regardless of how the block is defined.

Your method may not use any standard ruby method that is named all?, any?, none?, or one?.
=end


# solution 1
def one?(arr)
  return false if arr.empty?
  counter = 0
  arr.each do |obj|
    counter += 1 if yield(obj)
    return false if counter > 1
  end
  counter == 1 ? true : false
end

# solution 2
def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one == true
    seen_one = true
  end
  seen_one
end

# test
puts one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
puts one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
puts one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
puts one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
puts one?([1, 3, 5, 7]) { |value| true }           # -> false
puts one?([1, 3, 5, 7]) { |value| false }          # -> false
puts one?([]) { |value| true }                     # -> false