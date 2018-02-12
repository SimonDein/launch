# Write a method that counts down to zero using recursion.


# // Solution 1
def to_zero(num)
  puts num
  if num != 0
    to_zero(num - 1)
  end
end

to_zero(20)


# // Solution 2
def to_zero2(num)
  if num <= 0
    puts num
  else
    puts num
    to_zero2(num - 1)
  end
end

to_zero2(10)


arr = [1, 2, 3, 4]

arr.each {|num| num * 2}
