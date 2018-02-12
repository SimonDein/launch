# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version,
# and every lowercase letter by its uppercase version.
# All other characters should be unchanged.
# You may not use String#swapcase; write your own version of this method.

# solution 1
def swapcase(string)
  swapped_case =  string.chars.map do |char|
    if char =~ /[a-z]/ then char.upcase
    elsif char =~ /[A-Z]/ then char.downcase
    else char.downcase
    end
  end
  swapped_case.join
end


puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'