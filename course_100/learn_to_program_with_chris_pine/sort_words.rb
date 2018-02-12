words = Array.new

# ask for words
puts "Feed me words - press enter on an empty line to finish."

# if input is not an empty string push it to list - else break
while true
  word = gets.chomp.to_s
  if word == ""
    break
  else
    words.push(word)
  end
end

# show the user his input vs. sorted
puts "Your original input was:"
puts words
puts ""

puts "Your input sorted:"
puts words.sort
puts ""
