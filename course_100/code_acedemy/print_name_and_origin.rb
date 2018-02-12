=begin
First program written in the "Learn Ruby" course on Code Academy

Simple program that prompts the user to enter name, last name, city and state,
and prints back a string with the input put together
=end

print "What's your first name? "
first_name = gets.chomp
first_name.capitalize!

print "What's your last name? "
last_name = gets.chomp
last_name.capitalize!

print "What city are you from? "
city = gets.chomp
city.capitalize!

print "What state/country are you from? Please provide the abbreviation for state (like NY for New York) "
state = gets.chomp
state.upcase!

puts "Your name is #{first_name} #{last_name}, and you're from #{city}, #{state}!"

(start_year..end_year).each do |year|
  if year % 4 == 0 and year % 100 != 0
    year.push(leap_years)
  else
  end
end
