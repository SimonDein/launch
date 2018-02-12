# Write a method that returns the number of Friday the 13ths in the year given by an argument.
# You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) -
# and that it will remain in use for the foreseeable future.

MONTHS = 12

def friday_13th(year)
  friday_13th_count = 0
  1.upto(MONTHS) do |month|
    day = Time.new(year, month, 13)
    friday_13th_count += 1 if day.friday?
  end
  friday_13th_count
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2