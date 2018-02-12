# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

=begin
The code above will return all of the elements of the original array in a new array.

Reject returns a new array consisting of all elements for which the given block is not true.
Puts is the last evaluated line of code - and puts always returns nil - which is not true.
This means that on each iteration the block evaluates to nil - not true - and each element is added
to the new array - and lastly returns that array.
=end
