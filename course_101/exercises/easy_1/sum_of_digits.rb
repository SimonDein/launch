
def sum(int)
  digits = int.to_s.split('').reduce {|sum, num| sum.to_i + num.to_i}
end


puts sum(23)
puts sum(496) == 19
puts sum(123_456_789) == 45
