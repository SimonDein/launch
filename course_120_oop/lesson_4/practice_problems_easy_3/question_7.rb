=begin
# What is used in this class but doesn't add any value?

Answer:
The explicit return in Light::informatin is unneccesary as any methods implicitly will return
the last evaluated expression.

Also the methods provided by the attr_accessor's are not used - though it might provide us functions we
need down the road.
=end

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end