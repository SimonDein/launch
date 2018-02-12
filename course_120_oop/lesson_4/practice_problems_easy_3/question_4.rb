# Given the class below, if we created a new instance of the class and then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  def initialize(type)
    @type = type
  end
end
# How could we go about changing the to_s output on this method to look like this: I am a tabby cat? (this is assuming that "tabby" is the type we passed in during initialization).

=begin
Answer:
To do that we would have to override the existing generic to_s method provided to us by Ruby.
We do that by defining a new to_s method in the class returning the value we want:
=end

class Cat
  attr_reader :type # define a getter method
  
  def initialize(type)
    @type = type
  end

  def to_s
    "I am a #{type} cat" # return a string with an interpolation of type in it.
  end
end

cat = Cat.new('tabby')
cat.to_s #=> I am a tabby cat