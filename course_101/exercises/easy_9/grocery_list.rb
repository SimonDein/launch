# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

# solution 1
def buy_fruit(grocery_list)
  list = []
  grocery_list.map do |item, count|
    count.times { |_| list << item }
  end
  list
end

# solution 2
def buy_fruit(grocery_list)
  grocery_list.map { |item, count| [item] * count}.flatten
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]