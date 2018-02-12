# Ask the user for his or hers favorite number
# Then suggest a bigger and better one

puts "Hey - What's your favorite number?"
num = gets.chomp.to_i

better_num = num + 1

puts ""
puts "That's a cool - but may i suggest #{better_num}? It's a bigger and better number!"
