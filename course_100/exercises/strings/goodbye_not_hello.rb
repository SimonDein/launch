greeting = 'Hello!'

greeting.replace("Goobye!")

puts greeting

# OR ----


greeting = 'Hello!'

greeting.gsub!('Hello', 'Goobye') # the gsub method looks for a pattern and replaces it with the value passed

puts greeting
