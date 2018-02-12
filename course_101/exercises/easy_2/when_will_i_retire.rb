puts "What is your age?"
age = gets.to_i

puts "When would you like to retire?"
retirement_age = gets.to_i

current_year = Time.now.year
years_till_retirement = retirement_age - age
year_of_retirement = current_year + years_till_retirement


puts "It's #{current_year}. You will retire in #{year_of_retirement}"
puts "You only have #{years_till_retirement} years of work to go!"
