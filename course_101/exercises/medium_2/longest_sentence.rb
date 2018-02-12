# Sentences may end with periods (.), exclamation points (!), or question marks (?).
# Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word.
# Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words.
# You should also print the number of words in the longest sentence.

file_content = File.read('longest_word_example_text.txt')
sentences = file_content.split(/[\?!.]/)
longest_sentence = ''

sentences.each do |sentence|
  sentence_length = sentence.split.count
  longest_sentence = sentence if sentence_length > longest_sentence.split.count
end

puts ''
puts "The longest sentence from this file is: #{longest_sentence}"
puts ''
puts "The sentence is #{longest_sentence.split.count} words long"
