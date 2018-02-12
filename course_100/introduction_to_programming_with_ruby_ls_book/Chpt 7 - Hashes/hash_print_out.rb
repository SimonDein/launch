
# Using some of Ruby's built-in Hash methods, write a program that loops through a hash
# and prints all of the keys. Then write a program that does the same thing except printing the values
# Finally, write a program that prints both.

skateboard =
{
  deck: "creature",
  trucks: "independant",
  wheels: "spitfire",
  griptape: "mob",
  bearings: "reds"
}

# Looping through and printing out keys
puts "keys:"
skateboard.each_key {|key| puts " #{key}"}
puts ""

# Looping through and printing out values
puts "values:"
skateboard.each_value {|value| puts " #{value}"}
puts ""

# Looping through and printing out key along with value
puts "My board setup:"
skateboard.each_pair {|key, value| puts " #{key}: #{value}"}
