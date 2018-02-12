
def average(arr)
  total = 0
  arr.each do |num|
    total += num
  end
  total / arr.length.to_f
end


puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
