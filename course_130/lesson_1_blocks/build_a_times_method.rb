# Building a times instance method like Integer#times

# Implementing it directly on the Integer class
class Integer
  def times
    num = 0
      loop do
        yield(num)
        num += 1
        break if num == self
      end
    num
  end
end

5.times { |num| puts num}
# 0
# 1
# 2
# 3
# 4
# => 5

# Implementing it as a "stand alone" method
def times(end_num)
  num = 0
  while num < end_num
    yield(num)
    num += 1
  end

  end_num
end

times(3) { |num| puts num}
# 0
# 1
# 2
# => 3