class Person
  attr_accessor :first_name, :last_name

  def initialize(n)
    @name = n.split
    @first_name = @name[0]
    @last_name = @name.size > 1 ? @name[-1] : ''
  end

  def name
    first_name + ' ' + last_name
  end
end

puts bob = Person.new('Robert')
puts bob.name                  # => 'Robert'
puts bob.first_name            # => 'Robert'
puts bob.last_name             # => ''
puts bob.last_name = 'Smith'
puts bob.name   