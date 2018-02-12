# Write a method that takes a string, and returns a new string in which every character is doubled.

def repeater(string)
  doubled = ''
  string.each_char { |char| doubled << char * 2}
  doubled
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''