

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*first_three, last|
  puts first_three.join(", ")
  puts last
end

=begin
Expected Output:
Let's start gathering food.
apples, corn, cabbage
wheat
We've finished gathering!
=end

# 2
gather(items) do |apples, *middle_entries, wheat|
  puts apples
  puts middle_entries.join(", ")
  puts wheat
end

=begin
Expected Output:
Let's start gathering food.
apples
corn, cabbage
wheat
We've finished gathering!
=end

# 3
gather(items) do |apples, *everything_else|
  puts apples
  puts everything_else.join(", ")
end

=begin
Expected Output:
Let's start gathering food.
apples
corn, cabbage, wheat
We've finished gathering!
=end

# 4
gather(items) do |food|
  puts food.join(', ')
end

=begin
Expected Output:
Let's start gathering food.
apples, corn, cabbage, and wheat
We've finished gathering!
=end
