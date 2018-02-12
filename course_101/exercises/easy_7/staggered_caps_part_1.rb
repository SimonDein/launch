# Write a method that takes a String as an argument,
# and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized,
# and the remaining characters are lowercase. Characters that are not letters should not be changed,
# but count as characters when switching between upper and lowercase.

# solution 1
def staggered_case(string)
  characters = []
  string.downcase.chars.each_with_index do |char, index|
    if index.even? then characters << char.upcase
    else characters << char.downcase
    end
  end
  characters.join
end

# solution 2
def staggered_case(string)
  index = -1
  characters = string.downcase.chars.map do |char|
    index += 1
    index.even? ? char.upcase : char.downcase
  end
  characters.join
end

# solution 3
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# Further Exploration
# Modify this method so the caller can request that the first character be downcased rather than upcased? # If the first character is downcased, then the second character should be upcased, and so on.

def staggered_case(string, start_at_first_char? = true)
  result = ''
  need_upper = start_at_first_char?
  string.chars.each do |char|
    if need_upper
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end
  result
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'