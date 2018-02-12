
# Write a method named include? that takes an Array and a search value as arguments.
# This method should return true if the search value is in the array, false if it is not.
# You may not use the Array#include? method in your solution.

# solution 1
def include?(list, obj_to_find)
  list.any? { |obj| obj == obj_to_find}
end

# solution 2
def include?(list, obj_to_find)
  item_found = false
  list.each { |obj| item_found = true if obj == obj_to_find}
  item_found
end

# solution 3
def include?(list, obj_to_find)
  !!list.find_index(obj_to_find)
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false