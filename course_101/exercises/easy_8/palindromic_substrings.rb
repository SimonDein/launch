# Write a method that returns a list of all substrings of a string that are palindromic.
# That is, each substring must consist of the same sequence of characters forwards as it does backwards.
# The return value should be arranged in the same sequence as the substrings appear in the string.
# Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case;
# that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

def substrings_at_start(string)
  sub_strings = []
  1.upto(string.size) do |count|
    sub_strings << string[0, count]
  end

  sub_strings
end

def substrings(string)
  all_sub_strings = []
  0.upto(string.size - 1) do |index|
    all_sub_strings << substrings_at_start(string[index, (string.size - index)])
  end
  all_sub_strings.flatten
end

def palindrome?(string)
  string == string.reverse && string.length > 1
end

def palindromes(string)
  all_substrings = substrings(string)
  palindromes = all_substrings.select { |sub| palindrome?(sub)}
  palindromes
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]