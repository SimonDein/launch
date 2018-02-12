# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of calling

oracle = Oracle.new
oracle.predict_the_future

=begin
The result will will differ.
It depends on the string returned from Oracle#choices.
At the moment three different strings can be returned, but all starting with "You will"
=end