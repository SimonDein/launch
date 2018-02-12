# Write a method that will take a short line of text, and print it within a box.

def print_in_box(str)
  string_length = str.length
  top =  "+-#{'-' * string_length}-+"
  bottom = top
  spacing = "| #{' ' * string_length} |"

  puts top
  puts spacing
  puts "| #{str} |"
  puts spacing
  puts bottom
end

# Modify this method so it will truncate the message if it will be too wide to fit inside a standard terminal window (80 columns, including the sides of the box).
# For a real challenge, try word wrapping very long messages so they appear on multiple lines, but still within a box.

MAX_WIDTH = 80

def print_in_box(str)
  string_length = str.length
  top =  "+-#{()'-' * string_length)[]}-+"
  bottom = top
  spacing = "| #{' ' * string_length} |"

  puts top
  puts spacing
  puts "| #{str} |"
  puts spacing
  puts bottom
end

print_in_box(str)
