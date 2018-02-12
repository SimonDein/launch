# Write a method that computes the difference between the square of the sum of the first n positive integers -
# and the sum of the squares of the first n positive integers.

# solution 1
def sum_square_difference(n)
  square_sum = (1..n).sum ** 2
  sum_squares = (1..n).reduce(0) { |sum, num| sum += num ** 2}
  square_sum - sum_squares
end

# solution 2
def sum_square_difference(n)
  sum = 0
  sum_of_sqaures = 0

  1.upto(n) do |num|
    sum += num
    sum_of_sqaures += num**2
  end

  sum**2 - sum_of_sqaures
end


# tests
puts sum_square_difference(3) == 22
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150