# Bubble Sort is one of the simplest sorting algorithms available.
# It isn't an efficient algorithm, but it's a great exercise for student developers.
# In this exercise, you will write a method that does a bubble sort of an Array.

# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described.
# Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument.
# You may assume that the Array contains at least 2 elements.

# solution 1
def bubble_sort!(arr) # optimized bubble sort (decreasing end_of_array)
  loop do
    swapped = false
    end_of_array = -2 # don't include the last item of arr as it is compared
                      # in the #each_with_index
    
    arr[0..end_of_array].each_with_index do |_, i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end_of_array -= 1 # decrease end_of_array by one as the tail of arr will be sorted
                      # on each iteration.
    end
    
    break unless swapped # break if no swaps occured on this iteration
  end
end


# tests
array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)