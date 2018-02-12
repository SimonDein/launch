# - input:
#   - a string only consisting of lowercase alphabetic characters
#   - chars: alphabetic characters
#
# - output:
#   - the string 'palindrome'
#     - if the input already is a palindrome
#   - a string of 1-2 letters if that make the string a palindrome
#     - the letters removed can be anywhere in the string
#     - with no delimiter
#     - should always try to create the longest palindrome
#     - in the same order they appear in the original string
#   - if not possible or palindrome < 3
#     - return 'not possible'
#
#
# DEF palindrome_creator(string)

def palindrome?(str)
  str.reverse == str
end

def palindrome_creator(string)
  return 'palindrome' if palindrome?(string)
  return 'not possible' if string.length < 3

  letters = string.split('')
  org_letters = letters.clone

  letters_removed = []

  letters.each_index do |index| 
    letters_removed << letters.delete_at(index)

    if palindrome?(letters.join)
      return letters_removed
    else
      letters_removed = []
      letters = org_letters
    end
  end



  return 'not possible'
end

p palindrome_creator('xabba')
p palindrome_creator('kjjjhjjj')
p palindrome_creator('mmop')
p palindrome_creator('jabchba')
p palindrome_creator("aajgmaa")
p palindrome_creator("hekyleh")
