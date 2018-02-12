# Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# solution 1
def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]


# Further Exploration:
# Write a method that rotates a string instead of an array.
# Do the same thing for integers. You may use rotate_array from inside your new method.
def rotate_string(str)
  rotate_array(str.chars).join
end


s = 'bananas'
puts rotate_string(s) ==  'ananasb'
puts s == 'bananas'


def rotate_integer(int)
  rotate_string(int.to_s).to_i
end

i = 374
puts rotate_integer(i) == 743
puts i == 374
