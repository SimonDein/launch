# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

=begin
Answer:
There is no difference in the result and both class definitions will arrive at the same result using the mehtods provided.

The only difference is that in the first defined Computer:class we writes directly to the ivar @template in the create_template method.
Where in the second one we call the Computer#template setter method.

In the show_template method of the second class definition we can leave off the reference to self as it's not required and
the Ruby style guide suggests to "avoid self where self is not required"
=end