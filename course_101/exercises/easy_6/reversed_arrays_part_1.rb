# Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method.
# The return value should be the same Array object.
# You may not use Array#reverse or Array#reverse!.

# solution 1
def reverse!(arr)
  arr_clone = arr.clone
  arr.clear
  arr_clone.each { |object| arr.unshift(object)}
  arr
end

def reverse!(arr)
  left_index = 0
  right_index = -1

  while left_index < arr.length / 2
    arr[left_index], arr[right_index] = arr[right_index], arr[left_index]
    left_index += 1
    right_index -= 1
  end
  arr
end



list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
puts list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
puts list == ["abc"]

list = []
reverse!(list) # => []
puts list == []