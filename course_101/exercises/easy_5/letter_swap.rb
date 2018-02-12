# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word is swapped.

# solution 1
def swap(str)
  letters_reversed = str.split(" ").map do|word|
    
    if word.length <= 1
      word
    else
      last_letter = word.slice!(-1)
      first_letter = word.slice!(0)
      word << first_letter
      word.prepend(last_letter)
    end
  end

  letters_reversed.join(" ")
end

# soltution 2
def swap(str)
  result = str.split.map do |word|
    word[0], word[-1] = word[-1], word[0]
    word
  end

  result.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
