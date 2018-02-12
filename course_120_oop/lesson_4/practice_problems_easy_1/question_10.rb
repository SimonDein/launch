# If we have the class below, what would you need to call to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

=begin
We would need to call #new on the Bag class and pass in two arguments as defined in initialize method,
like this:
=end

bag = Bag.new('brown', 'leather') #=> #<Bag:0x007fda6db27d30 @color="brown", @material="leather">