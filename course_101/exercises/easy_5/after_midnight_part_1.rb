# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm).
# Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

# solution 1
def format_digits(time)
  digits = [0, 0]
  time = time.to_s

  case time.length
  when 1 then digits[1] = time
  when 2
    digits[0] = time[0]
    digits[1] = time[1]
  end

  digits.join
end

def time_of_day(int)
  int = int % 1440
  hours = (int / 60)
  minutes = (int % 60)

  "#{format_digits(hours)}:#{format_digits(minutes)}"
end

# solution 2
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day(delta_minutes)
  delta_minutes = delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end


puts time_of_day(1440) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
