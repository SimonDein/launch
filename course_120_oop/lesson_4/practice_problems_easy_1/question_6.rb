# What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# Answer:
# Technically we don't have to - we can just call Object#instance_variable_get though it generally is not a good idea
# to access instance variables this way.
# Add a reader method - or both a reader and writer method if we also wish to be able to modify @volume:

class Cube
  :attr_reader :volume    # just reader - or
  :attr_accessor :volume  # both reader and writer method
  
  def initialize(volume)
    @volume = volume
  end

  def volume_get          # also an option
    @volume
  end
end