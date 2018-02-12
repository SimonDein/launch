# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument.

def missing(arr)
  result = []
  (arr[0]..arr[-1]).each do |current_num|
    result << current_num unless arr.any? { |num| num == current_num }
  end
  result
end

# Examples:
puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []