=begin
Given the following code...

bob = Person.new
bob.hi
And the corresponding error message...

NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
from (irb):8
from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'
=end


=begin
The problem is that we try to access a private method in the Person class - and private methods are only accessible internaly in the class - therefore can't be invoked as a public instance method.

- We could move it from a private method to be a public method.
- We could access the method from a public method we could call instead
=end

class MyClass
  def say_hi      # Here we invoke the private method from a public instance method
    hi
  end
  
  private
  
  def hi          # We could also just move this method above the "private" keyword
    "hi"
  end
end

new_obj = MyClass.new
puts new_obj.say_hi # => "hi"