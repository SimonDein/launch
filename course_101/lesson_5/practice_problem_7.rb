# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

=begin
The final values of a will be 2 and the final value of b will be [1, 8]

We assign a = 2
Then b = [5, 8]
Then finally arr = [a, b] # => [2, [5, 8]]

arr[0] is then reassigned to a new value - 4 - meaning that the array itself has been modified -
but not a.
This means a is still 2 and the array ceased to point to it.

arr[1][0] is a reference to the number 5 inside of b -
which means that once we reassign that index to point to result of 5 - a (5 - 2) -
we're modifying b in memory and b till now be pointing to [3, 8]
=end
