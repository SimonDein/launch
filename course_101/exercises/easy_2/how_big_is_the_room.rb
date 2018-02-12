SQFEET_TO_SQINCHES = 144
SQFEET_TO_SQCENTIMETERS = 929.03

puts "Enter the lenght of the room in feet:"
length = gets.to_f

puts "Enter the width of the room in feet:"
width = gets.to_f

square_feet = (length * width).round(2)
square_inches = (square_feet * SQFEET_TO_SQINCHES).round(2)
square_centimeters = (square_feet * SQFEET_TO_SQCENTIMETERS).round(2)

puts "The area of the room in square feet: #{square_feet}
The area of the room in square inches: #{square_inches}
The are of the room in square centimeters: #{square_centimeters}"
