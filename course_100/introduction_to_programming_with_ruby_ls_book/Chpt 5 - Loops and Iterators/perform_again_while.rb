# The "while-edition" of perform_again.rb

while true
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end
