# Given the following data structure use a combination of methods,
# including either the select or reject method, to return a new array identical in structure to the original but
# containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]


# solution 1
arr.map do |arr|
  arr.select do |num|
    num % 3 == 0
  end
end # => [[], [3], [9], [15]]


# solution 2
arr.map do |arr|
  arr.reject do |num|
    num % 3 != 0
  end
end # => [[], [3], [9], [15]]
