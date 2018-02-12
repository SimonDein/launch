def reverse_words(words)
  words_reversed = words.split(' ').map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  words_reversed.join(', ')
end


puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')
