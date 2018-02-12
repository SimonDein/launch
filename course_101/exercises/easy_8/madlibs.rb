# Mad libs are a simple game where you create a story template with blanks for words.
# You, or another player, then construct a list of words and place them into the story,
# creating an often silly or funny story as a result.
# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

def prompt(msg)
  puts "=> " + msg
end

 prompt "Enter a noun:"
 noun = gets.chomp

 prompt "Enter a verb:"
 verb = gets.chomp

 prompt "Enter an adjective:"
 adjective = gets.chomp

 prompt "Enter an adverb:"
 adverb = gets.chomp

 sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}?"
 sentence_2 = "The  #{adverb} #{noun} #{adjective} #{verb} when you tickle it"
 sentence_3 = "#{verb} the #{adverb} #{noun} #{adjective}!"

 puts [sentence_1, sentence_2, sentence_3].sample