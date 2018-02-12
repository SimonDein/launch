
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

half_numbers = numbers.map {|key, val| val / 2}

p half_numbers
