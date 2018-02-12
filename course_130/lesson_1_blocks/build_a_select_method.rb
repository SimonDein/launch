def select(arr)
  index = 0
  new_arr = []

  while index < arr.size
    current_element = arr[index]
    new_arr << current_element if yield(current_element)
    index += 1
  end

  new_arr
end

array = [1, 2, 3, 4, 5]
p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true