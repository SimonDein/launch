# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

=begin
Hash#shift - like Array#shift - removes (mutates) the first element, of the original collection,
as an array.
Because hashes consists of key/value pairs - removing an element means removing a key along with its value.

Shift in this case therefore removes and returns [:a, 'ant'] from the original hash.

Consulting the official Ruby documentaion will give a precise description on how the method works.
=end
