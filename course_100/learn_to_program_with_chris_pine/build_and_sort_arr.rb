words = []

loop do
  puts ">> Feed me words! Press Enter to quit and have the words listed back in alphabetical order:"
  word = gets.chomp

  break if word == ''
  words << word
end

puts "Your words were:"
words.sort.each {|word| puts word}
