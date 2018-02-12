# Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples.

# You may assume that the number passed in is an integer greater than 1.
def multisum(num)
  divisables = []
  1.upto(num) {|num| num % 3 == 0 || num % 5 == 0 ? divisables << num : next}
  divisables.sum
end


# Further exploration
# Investigate Enumerable.inject (also known as Enumerable.reduce), How might this method be useful in solving this problem?
def multisum(num)
  1.upto(num).inject(0) {|sum, num| num % 3 == 0 || num % 5 == 0 ? sum += num : sum}
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
