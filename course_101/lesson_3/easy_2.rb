# Question 1
# In this hash of people and their age,
# see if "Spot" is present.
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.has_key?("Spot") # => false

# Bonus:
# The methods Hash#key? and Hash#include? could do it just as well


# Question 2
munsters_description = "The Munsters are creepy in a good way."

munsters_description.capitalize # => "The munsters are creepy in a good way."
munsters_description.swapcase # => "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
munsters_description.downcase # => "the munsters are creepy in a good way."
munsters_description.upcase # => "THE MUNSTERS ARE CREEPY IN A GOOD WAY."


# Question 3
# Add ages for Marilyn and Spot to the existing hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)


# Question 4
# See if the name "Dino" appears in the string:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?('Dino') # => false

# or

advice.match('Dino') # => nil


# Question 5
# Show an easier way to write this array:
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]

# Could instead be written as an array of strings with the "percent string" %w instead like this:
flinstones = %w(Fred Barney Wilma Betty BamBam Pebbles) # => ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]


# Question 6
# How can we add the family pet "Dino" to our usual array:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# There's alot of different ways of adding it, but here's two of the most "straight" ways to do it:
flintstones << 'Dino'
flintstones.unshift('Dino')


# Question 7
# How can we add multiple items to our array? (Dino and Hoppy)
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push('Dino', 'Hoppy')

# or

flinstones.unshift('Dino', 'Hoppy')


# Question 8
# Shorten this sentence:
# Leave the advice variable as "house training your pet dinosaur.".
advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, advice.index('house')) # => "Few things in life are as important as "
puts advice # => "house training your pet dinosaur."

# Bonus:
# If the non-mutating String#slice method was used - we would get the same return value but the original string would
# be kept intact


# Question 9
# Write a one-liner to count the number of lower-case 't' characters in the following string:
statement = "The Flintstones Rock!"

statement.count('t') # => 2


# Question 10
# Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"

title.center(40) # => "       Flintstone Family Members        "
