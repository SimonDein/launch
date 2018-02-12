# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# solution 1
def remove_vowels(arr_of_strings)
  arr_of_strings.map do |str|
    str.gsub(/[aeiou]/i, '')
  end
end

# solution 2
def remove_vowels(arr_of_strings)
  arr_of_strings.map do |string|
    string.chars.select { |letter| !%w(a e i o u A E I O U).include?(letter)}.join('')
  end
end

# solution 3
def remove_vowels(arr_of_strings)
  arr_of_strings.map { |string| string.delete('aeiouAEIOU')}
end

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']