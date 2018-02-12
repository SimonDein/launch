# Question 1
# What would you expect the code below to print out?
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers #=> will print out the original array as #uniq is not a mutating method


# Question 2
#Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# 1. - what is != and where should you use it?
=begin
The "not equal" comparison operator (i.e. '!=') returns a boolean when comparing to objects - and basically
works the opposite of the "equal operator" (i.e. '==').
It can be used when you want to make sure a value/boolean/data type of a specific object doesn't match a certain
value/boolean/data type etc. - fx if you want to make sure that an input != 'nil' or 0.
=end

# 2. - put ! before something, like !user_name
=begin
The '!' operator (the "bang operator") in front of a object will return a boolean - and the returned boolean will
be the opposite of what object otherwise would have evaluated to.
Fx the number 1 - will normally evaluate to true by it self as it is niether nil or false - but if you prefix it
with '!' it will evaluate to the opposite - false - instead. Anything evaluating to true - will evaluate to false and
anything evaluating to false - will evaluate to true.
=end

# 3. - put ! after something, like words.uniq!
=begin
When '!' is appended after a method that has a corrisponding destructive method - the method will mutate
the object passed as an argument.
This is purely a Rubyist syntax convention when defining methods - and IS NOT a feature of the language it self.
I.e. appending '!' to any method won't magically turn it into a destructive method.
There are lots of mutating methods in the Ruby library that isn't appended by '!' - and therefore experience
with the language itself and referencing the ruby docs is crucial to learn and understand which methods are mutating
and which are not.
=end

# 4. - put ? before something
=begin
The '?' character literal notation can prefix a single character or escape sequence to turn it into a string.
Fx. ?6 => "6"
=end

# 5. - put ? after something
=begin
Like there is a convention in the Ruby language to append desctructive methods with a "!" to make it clear
that the method will mutate the caller - there's a convention to append mehtods returning a boolean with '?'.
Again, this is purely a convention and appending a method with '?' will not make it return a boolean.
These conventions are merely there to make it easier to see what a method will return or do to the arguments passed.

Other than that the '?' is used in Ruby ternary operator (short hand if/else statement)
=end

# 6. - put !! before something, like !!user_name
=begin
Pre-fixing '!!' to an object - will return a boolean of what the object evaluates to e.g. "true" or "false".
Anything other than "nil" or "false" will evaluate to "true" in Ruby.
!!"Hey yo" => true
!!22 => true
!!"nil" =>false
=end


# Question 3
# Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')


# Question 4
# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:
numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # => will delete and return 1
numbers.delete(1) # => will delete and return 2 (granted that the array is reset between method calls)


# Question 5
# Programmatically determine if 42 lies between 10 and 100.
(10..100).to_a.include?(42) # => true


# Question 6
# Starting with the string:
# Show two different ways to put the expected "Four score and " in front of it.
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")

# or

famous_words = "seven years ago..."
famous_words.insert(0, "Four score and ")


# Question 7
# If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call,
# what will be the result?
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# Running the string as if it was a recursive method call would return 42 (8 + 8 + 8 + 8 + 8 + 2)


# Question 8
# If we build an array like this:
# We will end up with a nested array - make this into an un-nested array.
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!


# Question 9
# Given the hash below -
# Turn this into an array containing only two elements: Barney's name and Barney's number
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones =  flintstones.keep_if {|k, _| k == 'Barney'}.to_a.flatten!

# or

flintstones.assoc("Barney") # given that the hash is reset between method calls
