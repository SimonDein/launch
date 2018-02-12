# What is the block's return value in the following code? How is it determined?
# Also, what is the return value of any? in this code. What gets output by this code?

[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

=begin
The return value of the block:
1. iteration => true
2. iteration => false
3. iteration => true

On each iteration the block is going to evaluate to a boolean - true or false.
Because no explicit returns are used, the last evaluated line of code will be what determines
what the block returns - in this case num.odd?

The return value of Array#any? in this case is "true". Array#any? evaluates to true if any
of the iterations return true - even if it's just one iteration evaluating to true.
Array#any? can be seen as the opposite to Enumarable#all? -
where every iteration has to return true in order for the method invocation to evaluate to true.

On each iteration the block will also output the value of the current argument to the block to -
the STDOUT (standard output) with 'puts'
=end
