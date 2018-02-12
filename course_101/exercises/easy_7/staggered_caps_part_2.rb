# Modify the method from the previous exercise so it ignores non-alphabetic characters when determining whether it should uppercase or lowercase each letter.
# The non-alphabetic characters should still be included in the return value; they just don't count when toggling the desired case.

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-zA-Z]/
      if need_upper
        result << char.upcase
      else
        result << char.downcase
      end
      need_upper = !need_upper  
    else
      result << char
    end
  end
  result
end

# Further Exploration
#Modify this method so the caller can determine whether non-alphabetic characters should be counted when determining the upper/lowercase state.
# That is, you want a method that can perform the same actions that this method does,
# or operates like the previous version.

def staggered_case(string, ignore_non_alphabetic = true)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-zA-Z]/ || !ignore_non_alphabetic
      if need_upper
        result << char.upcase
      else
        result << char.downcase
      end
      need_upper = !need_upper  
    else
      result << char
    end
  end
  result
end


puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'