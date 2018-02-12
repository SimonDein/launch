# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

# Answer:
# We can remove the defined getter and setter method and instead make a combined getter/setter using attr_accessor

class BeesWax
  attr_accessor :type # create getter and setter method for @type - saving 5 lines of code.
  
  def initialize(type)
    @type = type
  end

  def type            # delete
    @type
  end

  def type=(t)        # delete
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax" # here we can refer to the getter method instead of the ivar directly
  end
end

# refactored the class BeesWax will look like this:
# We went from 18 lines of code - down to 10

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end