# Write a method that displays a 4-pointed diamond in an n x n grid,
# where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

# solution 1
def make_diamond(arr, rows)
  start = 1
  1.upto(rows) do |iteration|
    arr << start
    iteration < (rows / 2.0).ceil  ? start += 2 : start -= 2
    break if arr.length == rows
  end
  arr
end

def display_diamonds(arr, rows)
  arr.each { |diamonds| puts ('*' * diamonds).center(rows)}
end

def diamond(rows)
  diamonds = []
  make_diamond(diamonds, rows)
  display_diamonds(diamonds, rows)
end

diamond(9) # =>
  #     *
  #    ***
  #   *****
  #  *******
  # *********
  #  *******
  #   *****
  #    ***
  #     *