daylight = [true, false].sample

def time_of_day(day_or_night)
  if day_or_night
    puts "It's daytime!"
  else
    puts "It's nightime!"
  end
end

time_of_day(daylight)
