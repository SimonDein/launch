# V1
def reverse_sentence(string)
  reversed_string = []
  words = string.split(" ").each {|word| reversed_string.unshift(word)}
  return reversed_string.join(" ")
end

puts reverse_sentence('Hello World')



# V2
def reverse_sentence2(string)
  string.split(" ").reverse.join(" ")
end

puts reverse_sentence2(" hello world")
