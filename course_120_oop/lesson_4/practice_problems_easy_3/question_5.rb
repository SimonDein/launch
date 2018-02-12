# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer #=> NoMethodError - no method named 'manufacturer' for instances of Television
tv.model #=> this would run whatever code is inside the Television#model method

Television.manufacturer #=> this would run and execute whatever code might be inside the Telivison::manufacturer class method
Television.model #=> NoMethodError - no method named 'model' for Television:Class