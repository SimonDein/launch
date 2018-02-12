# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.
# You may not use String#squeeze or String#squeeze

# solution 1
def crunch(str)
  stripped_string = ''
  str.chars.each_with_index { |letter, index| stripped_string << letter if stripped_string[- 1] != letter}
  stripped_string
end

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
