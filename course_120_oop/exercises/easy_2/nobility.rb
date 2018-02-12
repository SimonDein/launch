=begin
Now that we have a Walkable module, we are given a new challenge. Apparently some of our users are nobility, and the regular way of walking simply isn't good enough. Nobility need to strut.

We must have access to both name and title because they are needed for other purposes that we aren't showing here.
We need a new class Noble that shows the title and name when walk is called:
=end

module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Person
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title
  
  def initialize(name, title)
    super(name)
    @title = title
  end
  
  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  attr_reader :name

  private

  def gait
    "runs"
  end
end



byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"
my_cat = Cat.new('Beastmaster3000')
p my_cat.walk

my_cheetah = Cheetah.new('Killmachine')
p my_cheetah.walk