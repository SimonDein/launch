# What would be output by this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
The return of numbers.each will be => [3, 4]
The output from the code it self will be 1 and 3

What's happening is that on the first iteration we print the first number in the array - 1,
and then we remove the first element from the array - again 1.
On next iteration we move onto index 1 of the array - which now will be 3.
We print it and remove the first element of the array again - now 2.

Array#each looks at the array on each iteration - and now it looks like it's finished its loop.
So we end up with the array looking like this - [3, 4] and the output is 1 and 3 (it only ran two iterations)
=end


# What would be the output of this code?
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

=begin
The only difference from this code block to the former is the method invocation on numbers - Array#pop.
On first iteration - 1 is printed out - and one element is removed from the end of the array - 4.
On the secon iteration - 2 is printed - 3 is removed.
No the array looks like this: [1, 2] - meaning we are at the end of the array and each will break.
1 and 2 are printed inside the loop - and 3 and 4 are removed - and when the original array is returned at
the end it's going to be [1, 2] as it is now mutated.
=end
