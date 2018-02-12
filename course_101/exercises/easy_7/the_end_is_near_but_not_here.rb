# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

def penultimate(string)
  string.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

# Further Exploration

# Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them:

# strings that contain just one word, and strings that contain no words.
# Suppose we need a method that retrieves the middle word of a phrase/sentence.
# What edge cases need to be considered? How would you handle those edge cases without ignoring them?
# Write a method that returns the middle word of a phrase or sentence.
# It should handle all of the edge cases you thought of.

def middle_word(string)
  words = string.split
  middle_index = (words.length / 2.0).floor

  words[middle_index]
end

puts middle_word('')
puts middle_word('Hi')
puts middle_word('What is up?')
puts middle_word('Rockets are pretty cool')
puts middle_word("I'm going for a walk pretty soon")