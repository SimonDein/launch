# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

=begin
Answer:
Class methods are prepended by self in the method name and suggests that the method itself refers to the class.
The Television#manufacturer method is the only class method defined in the class.

Class methods can only be invoked on the class. So the class method can be invoked like this: Television.manufacturerß
=end