# Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero',
# 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

STRING_TO_DIGIT = {
  'one' => '1', 'two' => '2', 'three' => '3',
  'four' => '4', 'five' => '5', 'six' => '6',
  'seven' => '7', 'eight' => '8', 'nine' => '9'
}

def word_to_digit(string)
  STRING_TO_DIGIT.keys.each do |word|
    string.gsub!(/\b#{word}\b/i, STRING_TO_DIGIT[word])
  end
  string
end

puts word_to_digit('Please call me at Five five five one Two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'