# Write a method that takes a single String argument and returns a new string that contains the original value of the argument with the first character of every word capitalized and all other letters lowercase.

# solution 1
def word_cap(string)
  string.split.map(&:capitalize).join(" ")
end

# Further Exploration
# Ruby convenient provides the String#capitalize method to capitalize strings.
# Without that method, how would you solve this problem? Try to come up with at least two solutions.

def word_cap(string)
  capitalized_string = []
  string.split.each do |word|
    word.chars.each_with_index do |letter, index|
      index == 0 ? capitalized_string << letter.swapcase : capitalized_string << letter.downcase
    end
    capitalized_string << ' '
  end
  capitalized_string.join.chop
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'