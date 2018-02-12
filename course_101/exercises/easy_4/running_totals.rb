# Write a method that takes an Array of numbers, and returns an Array with the same number of elements,
# and each element has the running total from the original Array.

# solution 1
def running_total(arr)
  total = 0
  arr.map { |num| total += num}
end

# Further exploration
# Try to write the method using Ruby's enumerator#reduce/inject method
def running_total(arr)
  totals = []
  arr.inject(0) do |total, num|
    totals << num + total
    total += num
  end
  return totals
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
