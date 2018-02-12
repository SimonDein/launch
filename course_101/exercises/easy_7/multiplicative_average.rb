# Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

# solution 1
def show_multiplicative_average(arr)
  multiplicative_avarage = arr.reduce(:*) / arr.count.to_f
  
  format('And the result is %.3f', multiplicative_avarage)
end


puts show_multiplicative_average([3, 5])
# => The result is 7.500

puts show_multiplicative_average([6])
# => The result is 6.000

puts show_multiplicative_average([2, 5, 7, 11, 13, 17])
# => The result is 28361.667