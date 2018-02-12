# For this exercise, we'll be learning and practicing our knowledge of returning from lambdas, procs, and implicit blocks.
# Run each group of code below: For your answer to this exercise, write down your observations for each group of code.
# After writing out those observations, write one final analysis that explains the differences between procs, blocks, and lambdas.

# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc
=begin
Observations:

If we return from within a proc and that proc is defined inside a method - then we will immediately return from that method.
=end


# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc)
=begin
Observations:

returning from a Proc defined in Main will result in a LocalJumpError.
This happens because when programs execution jumps to where that Proc is defined when the proc is called - we cannot return from the top level of the program (Main)
=end


# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda
=begin
Observations:

Return inside a lambda will act just like return would in a method definition and returns to it's enclosing method.
=end


# Group 4
my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

=begin
Observations:

A lambda defined in Main that returns - will still return to it's enclosing method.
This happens because when the program execution jumps to where the lambda is defined - it takes into account it's calling enclosing - unlike a Proc.
=end


# Group 5
def block_method_3
  yield
end

block_method_3 { return }
=begin
Observations:

An implicit block - just like a Proc - containing a return will result in a LocalJumpError.
This happens in this example because the implicit block is defined in Main - and we cannot return form the top level of the program (Main)
=end


=begin
COMPARISON:

Procs and implicit blocks exhibit the same behavior (for the most part).
A return from a Proc inside a method definition will immediately return out of the method.
A return from an implicit block and a Proc defined at the top level (main) will result in a LocalJumpError -
as we can't return from the highest level of the program.

A return from a lambda - will always have the same outcome regardless of where it's defined. Program executiong will continue from the next line after the #call to that lambda.
=end