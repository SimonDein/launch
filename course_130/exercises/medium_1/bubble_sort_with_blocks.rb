# Make bubblesort take an optional block and sort from the returned value.

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index]) # we skip to next iteration if true
      else
        next if array[index - 1] <= array[index]  # same
      end

      array[index - 1], array[index] = array[index], array[index - 1] # otherwise swap
      swapped = true
    end

    break unless swapped # break if no objects was swapped on last iteration (meaning we're done sorting)
  end
  nil
end

# tests
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)

=begin
FURTHER EXPLORATION

Modify your solution so it only passes one element to the block at a time; the block should perform some sort of transformation to the argument, and #bubble_sort! itself should just use <= to compare two values.
=end

def bubble_sort!(arr)
  loop do
    swapped = false
    
    1.upto(arr.size - 1) do |index|
      previous_obj = yield(arr[index - 1])
      current_obj  = yield(arr[index])

      if previous_obj <= current_obj
        next
      else
        arr[index - 1], arr[index] = arr[index], arr[index - 1]
        swapped = true
      end
    end

    break unless swapped
  end
  nil
end

# You should be able to call the new bubble_sort! like this:
array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
array == %w(alice bonnie Kim Pete rachel sue Tyler)