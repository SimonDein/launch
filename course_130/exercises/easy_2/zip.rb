=begin
Description:

The Array#zip method takes two arrays, and combines them into a single array in which each element is a two-element array where the first element is a value from one array, and the second element is a value from the second array, in order.
=end


def zip(arr1, arr2)
  new_arr = []
  index = 0
  loop do
    new_arr << [arr1[index], arr2[index]]
    index += 1
    break if index >= arr1.size
  end
  new_arr
end

puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]