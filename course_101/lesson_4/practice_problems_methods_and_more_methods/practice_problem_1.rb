# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

=begin
The return value of array#select method in this example will be [1, 2, 3].
The reason being that the select method only looks for the "thruthiness" of the block passed to each element.
The last evaluated line of code in the method is 'hi' and, in Ruby, everything that's is not nil or false
evaluates to true.
So as the block returns true on each iteration - each element is selected and the new array returned
therefore ends up consistsing of the same elements from the original array
=end
