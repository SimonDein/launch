=begin
Description:
The Enumberable#max_by method iterates over the members of a collection, passing each element to the associated block.
It then returns the element for which the block returned the largest value.

input:
  Array

Output:
  - Object of the array of which the block returned the largest value
  - Nil if the array is empty

  if array is empty return nil
  for each element
    - if no max value is assigned 
=end

def max_by((first_obj, *arr))
  return nil if first_obj == nil

  highest_value = yield(first_obj)
  result = first_obj

  arr.each do |current_object|
    current_value = yield(current_object)
    if current_value > highest_value
      highest_value = yield(current_object)
      result = current_object
    end
  end
  result
end

# Test cases:
puts max_by([1, 5, 3]) { |value| value + 2 } == 5
puts max_by([1, 5, 3]) { |value| 9 - value } == 1
puts max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
puts max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
puts max_by([-7]) { |value| value * 3 } == -7
puts max_by([]) { |value| value + 5 } == nil