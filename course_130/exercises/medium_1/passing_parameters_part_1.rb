# Modify the method below so that the display/output of items is moved to a block, and its implementation is left up to the user of the gather method.

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Let's start gathering food."
end

# This leaves the choice of formatting and specific use case up to the user - providing a more flexible method
gather(items) { |items| puts items.join(', ') }
