# Write a method that takes a string, and returns a new string in which every consonant character is doubled.
# Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

# solution 1
def double_consonants(string)
  doubled = ''
  string.each_char do |char|
    if /[a-df-hj-np-tv-z]/i =~ char
      doubled << char << char
    else
      doubled << char
    end
  end
  doubled
end

# solution 2
def double_consonants(string)
  doubled = ''
  string.each_char do |char|
    doubled << char
    doubled << char if /[a-df-hj-np-tv-z]/i =~ char
  end
  doubled
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""