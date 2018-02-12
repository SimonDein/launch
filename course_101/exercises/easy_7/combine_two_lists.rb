# Write a method that combines two Arrays passed in as arguments,
# and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.
# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

# solution 1
def interleave(arr1, arr2)
  index = 0
  combined_arr = []

  loop do
    combined_arr << arr1[index]
    combined_arr << arr2[index]
    index += 1
    
    break if index >= arr1.length
  end
  combined_arr
end

# solution 2
def interleave(arr1, arr2)
  combined_arr = []
  arr1.each_with_index { |arr1_object, index| combined_arr << [arr1_object, arr2[index]]}
  combined_arr.flatten
end # This can be shortened down like the following:

def interleave(arr1, arr2)
  combined_arr = []
  arr1.each_with_index { |obj, index| combined_arr << obj << arr2[index]}
  combined_arr
end

# further exploration
# See if you can rewrite interleave to use zip.

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end



puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']