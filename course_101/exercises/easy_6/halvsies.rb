# Write a method that takes an Array as an argument, and returns two Arrays that contain the first half and second half of the original Array, respectively.
# If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

# solution 1
def halvsies(arr)
  arr1 = arr[0, (arr.size / 2.0).ceil]
  arr2 = arr[(arr.size / 2.0).ceil, arr.size - arr1.size]
  [arr1, arr2]
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]