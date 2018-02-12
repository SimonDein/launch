# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end


=begin
The return value of map here will be => [nil, 'bear'].
Enumerable#map will return a new array with the result of running the block once for every element.
Here we say that if the length of the value strings is above three - return the original value - which will
be added to the array.
On the first iteration 'ant' is not bigger than three - and nothing is returned; nil.
On the second iteration - 'bear' is longer than 3 characters - and 'bear' is returned.
=end
