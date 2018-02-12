# ask for start and end year
puts "This is THE LEAP YEAR GENERATOR 3000X!!!"
puts "You will now be asked, for a starting and an ending year, and i'll list all leap years inbetween including start and end year."
puts ""

puts "Start year:"
start_year = gets.chomp.to_i

puts "End year:"
end_year = gets.chomp.to_i

# iterate over range of years and adds leap years to array
leap_years = Array.new

(start_year..end_year).each do |year|
  leap_years.push(year) if year % 4 == 0 and year % 100 != 0
end

puts leap_years
