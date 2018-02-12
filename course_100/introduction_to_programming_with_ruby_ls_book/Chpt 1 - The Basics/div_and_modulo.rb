# Find the digit in the thousands place
puts 6423 / 1000

# Find the digit in the hundreds place
puts ((6423 % 1000) / 100)

# Find the digit in the tenths place
puts (((6423 % 1000) % 100) / 10)

# Find the digit in the tenths place
puts (((6423 % 1000) % 100) % 10)
