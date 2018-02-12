require 'pry'
# Modify the following code to accept a string containing a first and last name. The name should be split into two instance variables in the setter method, then joined in the getter method to form a full name.

class Person

  def name=(full_name)
    full_name = full_name.strip

    @first_name = first_name(full_name)
    @last_name = last_name(full_name)
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def first_name(n)
    return '' if n.empty?
    n.split[0]
  end

  def last_name(n)
    return '' if n.split[1] == nil
    n.split[1]
  end
end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name