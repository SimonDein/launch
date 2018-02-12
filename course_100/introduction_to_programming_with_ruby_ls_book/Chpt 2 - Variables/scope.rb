# Simple example that illustrates the scope of variables
# "Inner scope can access variables initialized in an outer scope, but not vice versa"
random = 77
arr = [1, 2, 3]

for i in arr do
  num = 3
  puts random
end

puts num
