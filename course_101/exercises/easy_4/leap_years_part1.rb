# Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year,
# or false if it is not a leap year.

# solution 1
def leap_year?(year)
  return nil if year < 0
  if (year % 4 == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0)
    true
  else
    false
  end
end

# solution 2
def leap_year?(year) # checks the least common occurence first
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

# solution 3
def leap_year?(year) # more idiomatic method - though can be harder to understand
  (year % 400 == 0 && year % 100 == 0) || (year % 4 == 0 && year % 100 != 0)
end


puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
