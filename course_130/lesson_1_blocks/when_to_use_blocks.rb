=begin
#1 Case

When you want to leave some decisions / specifications to the method caller

When you define multiple methods to do something only a little different for different scenarios -
blocks can be used at invocation instead to provide that flexability between those scenerios -
without having to define multiple methods.

This way you can leave some of the choice of what the method should do to the time of method invocation.
=end

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After: #{after}"
end

# This method can be used however you want at invocation.
# Maybe you want to upcase your argument?
# Mayeb you only want a slice of the argument printed?

compare('something') { |word| word.upcase}
# Before: something
# After: SOMETHING
# => nil

# OR

compare('something') { |word| word.slice(2..5)}
# Before: something
# After: meth
# => nil



# ================================================

=begin
#2 Case

Methods that need to perform some "before" and "after" actions - sandwhich code.

There are times when you'd want your method to be able to perform some "before" and "after" action -
and you don't care about what is executed inbetween.

There are many useful use cases for "sandwich code". Timing, logging, notification systems are all examples where before/after actions are important.
=end

def time_it
  time_before = Time.now
  yield # do whatever
  time_after = Time.now
  puts "It tooke #{time_after - time_before} seconds!"
end

time_it { sleep(3) }
# It took 3.000052 seconds!
# => nil

# This method doesn't care what action it performs - it simply does an action before - and after.