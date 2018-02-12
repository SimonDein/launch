# Continuing with our Person class definition, what does the below print out?

class Person
  attr_accessor :first_name, :last_name
  
  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def to_s        # Added for a better string representation of any Person objects
    name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split
    @first_name = parts[0]
    @last_name = parts.size > 1 ? parts[-1] : ''
  end
end


# Code of interest
bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

=begin
String interpolation is used on the instance of the object which the bob variable points to.
String interpolation will automatically call String#to_s on the Person object.
This will just print out a "coded" object representation
=end