=begin
What is the default return value of to_s when invoked on an object? Where could you go to find out if you want to be sure?

Answer:
In ruby most classes from the standard library provide their own to_s method,
that will return an appropriate string representation of the object.

But if to_s is invoked on a class that don't provide it's own to_s method (like any costum class that we might have created) -
the name of the class and an encoding of the objects object_id is returned.
=end
