# How does count treat the block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

=begin
When Ruby's Array#count method is given a block; it iterates over each object in the array
and returns the number of elements for which the given block returns true.
In this example count takes each string - passes it to the block - get a boolean returned -
if it's true it adds one to the count. When all elements has been passed, the method returns the sum
of how many iterations for which the block returned true - as an integer - in this case 2.

Consulting Rubys documentation will give an accurate description and explanation of how the method works,
what it returns and - in most cases - how it can be implemented.
=end
