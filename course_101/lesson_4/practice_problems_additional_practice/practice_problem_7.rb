# Create a hash that expresses the frequency with which each letter occurs in this string:
statement = "The Flintstones Rock"


# solution 1 - counts the ocurrences of each letter in the string capitalized or not
letter_occurences = {}
alphabet = ('a'..'z').to_a

alphabet.each do |letter|
  if statement.downcase.include?(letter)
    letter_count = statement.downcase.count(letter)
    letter_occurences[letter] = letter_count
  else
    next
  end
end

p letter_occurences


# solution 2 - makes a difference between capitalized and non-capitalized letters
letters_in_string = statement.chars.uniq
result = {}

letters_in_string.each do |letter|
  if letter == ' '
    next
  else
    letter_count = statement.count(letter)
    result[letter] = letter_count
  end
end

p result
