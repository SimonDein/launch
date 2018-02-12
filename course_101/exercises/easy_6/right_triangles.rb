# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars.
# The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# solution 1
def triangle(rows)
  1.upto(rows) { |num| puts "#{"*" * num}".rjust(rows)}
end

triangle(2)
triangle(7)
triangle(23)