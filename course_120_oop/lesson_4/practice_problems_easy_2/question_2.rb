# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

#What is the result of the following:

trip = RoadTrip.new
puts trip.predict_the_future
p RoadTrip.instance_methods

=begin
Answer:
The answer will still differ, but there is a big differnece.
Since the method was called by an instance of the RoadTrip class - Ruby will every time
it tries to resolve a method name look in that class first - even though the method is implemented
by the Oracle class.

In fact the method doesn't just belong the Oracle class anymore, it's IMPLEMENTED in that class,
BUT when RoadTrip inherits from Oracle - the method belongs just as much to RoadTrip as Oracle.
So we can actually look at it as everything is resolved inside the RoadTrip class.
=end