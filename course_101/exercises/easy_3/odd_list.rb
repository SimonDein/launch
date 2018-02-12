# Write a method that returns an Array that contains every other element of an Array that is passed in as an argument.
# The values in the returned list should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument Array.

# solution 1
def oddities(arr)
  selected_objects = []
  arr.each_with_index { |obj, i| selected_objects << obj if i.even?}
  selected_objects
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# solution 2
def oddities2(arr)
  index = -1
  arr.select do |obj|
    index += 1
    index.even?
  end
end


puts oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities2(['abc', 'def']) == ['abc']
puts oddities2([123]) == [123]
puts oddities2([]) == []
