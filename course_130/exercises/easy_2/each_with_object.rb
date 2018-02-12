
# should take two arguments:
# a collection to iterate
# an object to pass to the block

# It should yield each element of the collection as well as an object of some sort

# Return value:
# The final value of object
# If the collection is empty - return the original object passed as the second argument

def each_with_object(arr, object)
  arr.each do |element|
    yield(element, object)
  end
  object
end

# examples:
result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
puts result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
puts result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
puts result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
puts result == {}