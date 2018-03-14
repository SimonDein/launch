=begin
Consider a character set consisting of letters, a space, and a point.
Wrods consist of one or more, but at most 20 letters. An input text consists of one or more words seperated from each other by one or more spaces and terminated by 0 or mores paces folowed by a point.
Input should be read from, and including, the first letter of the first word, up and including the termanating point.
The output text is to be produced such that successive words are seperated by a single space with last word being terminated by a single point.
Odd words are copied in a reverse order while even words are merely echoed.

For example the input string:
" What's the mater with Kansas." becomes "whats eht matter htiw kansas."
=end

# TESTS



def odd_words(input)
  words = input.downcase.scan(/\b[a-z']+\b/i)
  words = words.map.with_index { |word, index| index % 2 == 0 ? word : word.reverse }
  words.join(' ') + '.'
end

p odd_words('The king got up and left.') #=> 'The gink got pu and tfel."

p odd_words(' the block  . ') #=> 'the kcolb.'
p odd_words("  we don't.") #=> "we t'nod"