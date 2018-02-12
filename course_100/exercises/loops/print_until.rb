# This way of printing out the values of the numbers array mutates it - but does indeed solve the exercise

numbers = [7, 9, 13, 25, 18]

until numbers.length == 0
  puts numbers.shift
end

puts "With this solution the array has been mutated and is now empty: numbers = #{numbers}"


# OR
# This way we keep everthing "intact" - i.e. a non-destructive way of printing out numbes with a "until loop"
puts "---"


numbers = [7, 9, 13, 25, 18]

counter = 0

until counter == numbers.length
  puts numbers[counter]
  counter += 1
end

puts "With this solution the array has NOT been mutated and is kept intact: numbers = #{numbers}"
