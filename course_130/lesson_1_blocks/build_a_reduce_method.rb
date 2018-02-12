def reduce(arr, default = 0)
  index = 0
  accumelator = default

  while index < arr.size
    accumelator = yield(accumelator, arr[index])
    index += 1
  end
  
  accumelator
end

array = [1, 2, 3, 4, 5]

puts reduce(array) { |acc, num| acc + num }                    # => 15
puts reduce(array, 10) { |acc, num| acc + num }                # => 25
puts reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass