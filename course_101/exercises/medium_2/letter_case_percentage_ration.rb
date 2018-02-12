# In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

# You may assume that the string will always contain at least one character.

def letter_case_counts(string) # count letter case occurences
  letter_count = {:lowercase => 0, :uppercase => 0, :neither => 0}
  string.chars.each do |char|
    case char
    when /[a-z]/ then letter_count[:lowercase] += 1
    when /[A-Z]/ then letter_count[:uppercase] += 1
    else                letter_count[:neither] += 1
    end
  end
  letter_count
end

def letter_case_percentage_ratios(letter_count) # transform occurences to their percentage ratio
  total_chars = letter_count.values.sum
  letter_count.each do |key, val|
    letter_count[key] = val.to_f / total_chars * 100
  end
end

def letter_percentages(string)
  letter_count = letter_case_counts(string) # get letter occurrences
  letter_case_percentages = letter_case_percentage_ratios(letter_count) # transform occurences to ratio
  letter_case_percentages
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }