# A triangle is classified as follows:

# equilateral All 3 sides are of equal length
# isosceles 2 sides are of equal length, while the 3rd is different
# scalene All 3 sides are of different length
# To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side,
# and all sides must have lengths greater than 0: if either of these conditions is not satisfied,
# the triangle is invalid.

# Write a method that takes the lengths of the 3 sides of a triangle as arguments,
# and returns a symbol :equilateral, :isosceles, :scalene, or :invalid -
#  depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

# solution 1
def triangle(a, b, c)
  sides = [a, b, c].sort
  return :invalid if sides[0..1].sum < sides[-1] || sides.any? { |val| val <= 0}

  sides_of_equal_length = sides.reduce(0) do |memo, side|
    count = sides.count(side)
    count > memo ? count : memo
  end

  case sides_of_equal_length
  when 3 then :equilateral
  when 2 then :isosceles
  else :scalene
  end
end

# solution 2
def triangle(a, b, c)
  sides = [a, b, c]
  longest_side = sides.max

  case
  when longest_side * 2 > sides.reduce(:+), sides.include?(0) then :invalid
  when a == b && b == c then                                       :equilateral
  when a == b || b == c || a == c then                             :isosceles
  else                                                             :scalene
  end
end


puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid