# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

=begin
The code above will return a hash, with the first letter,
of each string in the array as key and the full string as the corrisponding value.

When Array#each_with_index is invoked on the array - each string is passed in as argument to the block,
and a collection - in this case a hash - is initialized as empty.

On each iteration we then assign the first letter of the string passed, as key, and the full string as value,
to the hash - and we end of with a hash consisting of both keys and values as strings - and the keys being
the first letter of the full string. 
=end
