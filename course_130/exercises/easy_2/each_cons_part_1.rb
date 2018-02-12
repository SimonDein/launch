=begin
Description:
The Enumberable#each_cons method iterates over the members of a collection taking each sequence of n consecutive elements at a time and passing them to the associated block for processing.
It then returns a value of nil.

Write a method called each_cons that behaves similarly for Arrays, taking the elements 2 at a time. The method should take an Array as an argument, and a block.
It should yield each consecutive pair of elements to the block, and return nil.
=end

# solution 1
def each_cons(arr)
  index = 0
  while (arr.size - index) > 1
    yield(arr[index], arr[index + 1])
    index += 1
  end
  nil
end

# solution 2
def each_cons(arr)
  arr.each_with_index do |obj, index|
    break if (arr.size - index <= 1)
    yield(obj, arr[index + 1])
  end
end


# test cases:
hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end

puts result == nil
puts hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([]) do |value1, value2|
  hash[value1] = value2
end
puts hash == {}

hash = {}
each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
puts hash == {'a' => 'b'}