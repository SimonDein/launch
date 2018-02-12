# Let's build another program using madlibs.
# We made a program like this in the easy exercises. This time, the requirements are a bit different.

# Make a madlibs program that reads in some text from a text file that you have created,
# and then plugs in a selection of randomized nouns,
# verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives,
# and adverbs directly into your program, but the text data should come from a file or other external source.
# Your program should read this text, and for each line, it should place random words of the appropriate types into the text,
# and print the result.

# solution 1
NOUNS =      ['man', 'alien', 'dog', 'icecream', 'surfboard', 'book', 'sword', 'chicken', 'shoe', 'cop']
VERBS =      ['screams', 'runs', 'kicks', 'pets', 'throws', 'stumbles', 'takes', 'whacks', 'passes', 'shoots']
ADJECTIVES = ['black', 'sweet', 'weird', 'funky', 'beautiful', 'gorgeous', 'dead', 'stupid', 'intelligent', 'rainbow colored']
ADVERBS =    ['newly', 'always', 'sometimes', 'carefully', 'recklessly', 'terribly', 'slowly', 'lighting fast', 'incredibly']

File.open('text_for_madlibs_revisited.txt') do |text|
  text.each do |line|
    puts format(line, noun:      NOUNS.sample, # format is passed a sample of words for each line for substitution
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end

# =>  The rainbow colored cop shoots over a rock.
      # The alien close by him sees it and recklessly kicks him to calm him down
      # A chicken analyzes the situation, but he's beautiful - so he leaves immediatly.
      # A lighting fast beautiful day to be alive - wouldn't you say?