# Write a program that will ask a user for an input of a letter or multiple letters and -
# give back the number of characters. Spaces should not be counted as a character.

puts "Please write a sentence or just a single word and press enter:"
words = gets.chomp
number_of_characters = words.split('').select{ |letter| letter >= 'A'}.count

puts "The sentence/word '#{words}' has #{number_of_characters} number of characters in it!"
