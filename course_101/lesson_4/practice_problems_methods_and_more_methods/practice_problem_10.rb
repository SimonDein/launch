# What is the block's return value in the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end


=begin
Again, like Enumerable#map, Array#map returns a new array with the return value of running the block once per element.
On the first iteration 1 is passed and because on is not bigger than 1 - it's own value is returned
On the next two iterations the arguments passed in - 2 and 3 - will be bigger than 1 and 'puts num' -
will be executed.
Puts will always return nil - and nil is added to the array twice.
The return value of map in this case will therefore be => [1, nil, nil]
=end
