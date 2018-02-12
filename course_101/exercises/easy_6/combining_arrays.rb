# Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays.
# There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

# solution 1
def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

# solution 2
def merge(arr1, arr2)
  merged = []
  arr1.each { |object| merged << object}
  arr2.each { |object| merged << object if !merged.include?(object)}
  merged
end

# solution 3
def merge(arr1, arr2)
  arr1 | arr2 # set union - Ruby method for combining two arrays with no duplicates
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]