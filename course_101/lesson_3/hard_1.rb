# Question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?
if false
  greeting = “hello world”
end

greeting # => nil

=begin
Normally when referencing an unitialized variable an error thrown stating that "The no method or variable of that name can be accessed".
But when referencing an unitialized variable in an "if"-statement - even if that if block isn't run - the variable is
initialized and set to "nil".
=end


# Question 2
# What is the result of the last line in the code below?
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => hi there
puts greetings # => {:a=>"hi there"}

=begin
First the informal_greeting is pointed to same string object that the :a-key holds (informal_greeting = 'hi').
Next informal_greeting is directly mutating the string object in place by using the << (shovel operator)
to append ' there' (informal_greeting = 'hi there').

That means that the same string object that the greeting key :a is holding onto, is now also altered and looks like this - greeting = {:a=>'hi there'}
So at "print out" - the informal_greeting variable holds the string "hi there" of the a: key in the greeting hash,
and the greeting hash holds the same string but with the corrisponding key (:a)
=end


# Question 3
# What will be printed by each of these code groups?

  # A
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => one is: one
puts "two is: #{two}" # => two is: two
puts "three is: #{three}" # => three is: three

=begin
The strings are passed into the method and immediatly re-assigned to new strings - but none of them are mutated in place nor returned and captured.
Therefore the original strings are kept intact and printed with their original values.
=end

  # B
def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => one is: one
puts "two is: #{two}" # => two is: two
puts "three is: #{three}" # => three is: three

=begin
Again - the same is going on here. The strings are passed into the method. The parameters points to the same physical space in memory at start,
but the the variables are re-assigned and never returned and captured on the outside. Though the names of the parameters are
the same as the variables on the outside - the paramteters "live in its own container" and has nothing to do with the variables on the outside.
The only thing that could affect the variables on the outside is if the objects were changed in place (mutated) with fx. << or
any other desctructive method.
=end

  # C
def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => one is: two
puts "two is: #{two}" # => two is: three
puts "three is: #{three}" # => three is: one

=begin
Here we see an exact example of what i described before - here a desctructive method is called directly on the same objects in memory.
The strings are passed as arguments to the method, the parameters reference the strings passed in memory,
the parameters referencing the strings in memory then have a desctructive method called up them - changing the original
strings in memory.
And when the method ends - the strings are altered in memory and we se the result at print out.
=end


# Question 4
=begin
Ben was tasked to write a simple ruby method to determine if an input string is an IP address representing dot-separated numbers.
e.g. "10.4.5.11". He is not familiar with regular expressions. Alyssa supplied Ben with a method called is_an_ip_number?
that determines if a string is a valid ip address number and asked Ben to use it.

Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things.
You're not returning a false condition, and you're not handling the case that
there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."

Help Ben fix his code.
=end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# refactored
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4 # return false if the array has anything but 4 entries

  while dot_separated_words.size > 0 do # iterate through the adress and return false if any of the entries isn't legit
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true # if everything passes - meaning nothing evaluating to false - we return true
end
q
