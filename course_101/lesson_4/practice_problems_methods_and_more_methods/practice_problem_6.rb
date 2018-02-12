# What is the return value of the following statement? Why?

['ant', 'bear', 'caterpillar'].pop.size

=begin
This will return 11

Array#pop is first called on the array - removing and returning the last object in the array -
in this case 'caterpillar'.
Next String#size is called on the string returned from the pop method - which returns
and integer representing how many characters are in the string - in this case 11.
=end
