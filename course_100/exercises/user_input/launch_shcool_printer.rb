
answer = 0

loop do
  puts ">> How many times do you want to print. Enter a number >= 3:"

  answer = gets.to_i
  if answer >= 3
    break
  end
  puts "Please enter a number bigger than 3"
end

puts "Launch School is the best \n" * answer
