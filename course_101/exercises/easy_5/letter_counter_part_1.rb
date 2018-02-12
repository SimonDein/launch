# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.
# Words consist of any string of characters that do not include a space.

# solution 1
def word_sizes(string)
  words_size_occurences = {}

  word_sizes = string.split.map { |word| word.length}
  word_sizes.each { |size| words_size_occurences[size] = word_sizes.count(size) }

  words_size_occurences
end

# solution 2
def word_sizes(string)
  words_size_occurences = Hash.new(0)
  string.split.each { |word| words_size_occurences[word.length] += 1}
  words_size_occurences
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}
