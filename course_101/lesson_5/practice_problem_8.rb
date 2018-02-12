# Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


# solution 1
vowels = %w(A E I O U Y a e i o u y)

hsh.each do |_, words|
  words.each do |word|
    word.chars.each do |letter|
      puts letter if vowels.include?(letter)
    end
  end
end


# solution 2
hsh.each do |key, list_of_words|
  list_of_words.each do |word|
    puts word.chars.select {|letter| vowels.include?(letter)}
  end
end
