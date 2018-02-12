=begin
For this exercise, we'll be learning and practicing our knowledge of the arity of lambdas, procs, and implicit blocks.
Two groups of code also deal with the definition of a Proc and a Lambda, and the differences between the two.
Run each group of code below: For your answer to this exercise, write down your observations for each group of code.
After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.
=end

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." } # proc is equivalent to Proc.new
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

=begin
Observations:
On line 9 - local var 'my_proc' is assigned to a new proc object
On line 10 - a string representation of 'my_proc' is printed out (with Ruby's standard to_s method returning an 'encoding' of the object)

On line 11 - the class of the object, which is Proc, is printed out
On line 12 - The block is called by with no arguments passed. This doesn't return and Error and the string is printed with the block parameter evaluated to nil.

On line 13 - an argument is passed to the block parameter variable and 'This is a cat' is printed.
=end

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }

puts my_lambda
puts my_second_lambda

puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

=begin
Observations:
Line 27 - the Kernel#lambda is called - which is equivalent to Proc.new - except the resulting Proc object checks the number of arguments passed when called.

Line 28 - This assignment is equivalent to line 26 - it's an older syntax from Ruby 1.9 using what's called "The stab operator"

Line 30 - prints out a string representation Proc object - with '(lambda)' appended to the end
Line 31 - same as line 30
Line 32 - prints out 'Proc' as a lambda is just a proc object that is strict on it's arguments passed
Line 34 - The proc is invoked and passed the argument 'dog' and proc will execute as normal
Line 35 - The proc is invoked, but is not passed any arguments - and due to lambda's strict arity rules - the block returns an ArgumentError (given 0, expected 1)

Line 36 - We try to instantiate a new object from the non-existant Lambda class - resulting in a NameError
=end


# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

=begin
Observations:
Line 55 - we call the method passing an argument - inside the method we yield to the block though without any argument.
This results in "This is a ." is printed out

Line 56 - We call the method passing an argument - but no block. This results in a LocalJumpError as when yield is invoked and no block is found.
=end


# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

block_method_2('turtle') { puts "This is a #{animal}."}

=begin
Observations:
Line 76 - We invoked the method passing it an argument which i passed on to the block - and the string "This is a turtle" is printed out.

Line 77 to 79 - We invoke the method passing it the string 'turtle' which is the passed to the block.
Inside the block 'turtle' is assigned to the block param variable turtle and the second block param variable is not passed an argument - resulting in the seal var evaluating to nil.
The string "This is a turtle and a ." is therefore printed out.

Line 81 - Blocks throws a NameError if a variable is referenced that doesn't exist in the block's scope
=end




=begin
Take Aways From Analysis:

Blocks, Proc's and Lambda's:
- A block is an enclosed piece of code you pass to a method as an argument
  - A block binds it's surrounding context - variables, constants, objects etc.
  - Blocks have loose arity rules (argument rules)
  - Blocks throws a NameError if a variable is referenced that doesn't exist in the block's scope
  
- A proc is a block wrapped in a Proc object and acts like a block
  - Proc objects can be created with kernel#proc instead of Proc.new (results in the same)
  - Can be called with #yield or #call

- A lambda is just a Proc object that has strict argument rules (arity rules) and acts like a method
  - Unlike a "normal" proc or block - a lambda will throw an ArgumentError if the number of arguments vs. params doesn't match up
  - A lambda is not a class of it's own. It's an instance of the Proc class.

Yielding to a block:
  - Yield throws a LocalJumpError if no block is passed to the enclosing method


COMPARISON:

1. Lambdas are types of Proc's. Technically they're both Proc objects. An implicit block is not an object; but just a grouping of code - a type of closure - but not an object!

2. Lambda's enforce the number of arguments. Implicit blocks and Proc's do not enforce the number of arguments passed in.
=end