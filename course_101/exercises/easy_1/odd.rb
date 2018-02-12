# V1
def is_odd_1?(int)
  int % 2 == 1
end

p is_odd_1?(-2)


# V2
def is_odd_2?(int)
  int.remainder(2) == 1 || int.remainder(2) == -1
end

p is_odd_2?(2)


#V3
def is_odd_3?(int)
  [1, -1].include?(int.remainder(2))
end

p is_odd_2?(3)
