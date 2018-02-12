# Write your own version of the rails titleize implementation.

# Example:
words = "the flintstones rock"
# would be:
words = "The Flintstones Rock"


# solution 1
def titleize(sentence)
  titleized_string = []

  sentence.split.each do |word|
    titleized_string << word.capitalize
  end
  titleized_string.join(' ')
end

words = 'the flintstones rock'
p titleize(words) # => "The Flintstones Rock"


# solution 2
def titleize2(sentence)
  sentence.split.map { |word| word.capitalize}.join(' ')
end

p titleize2(words)
