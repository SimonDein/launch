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

  private

  def parse_full_name(full_name)
    parts = full_name.split
    @first_name = parts[0]
    @last_name = parts.size > 1 ? parts[-1] : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# The names of the two instances of a person can be compared by calling a reader method on the intances and compare the returned value to each other:

puts bob.name == rob.name
