# How would you order this array of number strings by descending numeric value?
arr = ['10', '11', '9', '7', '8']

# solution 1
arr.sort_by do |num|
  num.to_i
end # => ["7", "8", "9", "10", "11"]


# solution 2
arr2 = arr.sort do |a, b|
  a.to_i <=> b.to_i   # notice that a and b are put in reverse orde to
end # => ["7", "8", "9", "10", "11"]
