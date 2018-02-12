def digit_list(arr)
  arr.to_s.split("").map{|n| n.to_i}
end

puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
