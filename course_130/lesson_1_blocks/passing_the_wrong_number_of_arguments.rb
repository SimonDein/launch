def test
  yield(1, 2)
end

test { |num| puts num}
# 1 - prints only the first argument passed

def test
  yield(1)
end

test { |num1, num2| puts "#{num1} #{num2}"}
# 1 - again we only see the 1 printed out
# This time though the block variable num 2 is actually assigned to nil
# as no value is assigned to it. Nil is interpolated to an empty string. So
# we actually print out "1 " (with the extra space)