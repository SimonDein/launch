=begin
Consider the following class definition:

There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

Answer:
The @database_handle should be permanent and unique to any instance of flight.
Having both a reader and writer on database_handle introduces the chance of changing the
handle from outside the class. To shut that posibility down we can remove the writer and only expose
a reader method to outside of the class.
=end

class Flight
  attr_reader :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end


