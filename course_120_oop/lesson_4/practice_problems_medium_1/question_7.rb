# How could you change the method name below so that the method name is more clear and less repetitive.

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end
end

=begin
Answer:
As a general rule - when you define methods - leave off the name of the class of which you want
to invoke it on. That means that means that the self.light_information instance method should shortened
down to just Light#information.
=end