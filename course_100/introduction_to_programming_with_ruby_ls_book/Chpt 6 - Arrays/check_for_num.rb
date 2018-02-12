# Below we have given you an array and a number
# Write a program that checks to see if the number appears in the array
# arr = [1, 3, 5, 7, 9, 11]
# number = 3

arr = [1, 3, 5, 7, 9, 11]
number = 3

# // Solution 1
if arr.include?(number)
  puts "#{number} is in the array"
else
  puts "#{number} isn't in the array"
end


# // Solution 2
arr.each do |num|
  if num == number
    puts "#{number} was found with each instead of include"
  end
end
