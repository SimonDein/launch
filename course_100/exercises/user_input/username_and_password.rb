valid_password = "SurfIsUp"
valid_user = "Kelly Slater"

loop do
  puts "Please enter user name:"
  user = gets.chomp

  puts "Please enter password:"
  password = gets.chomp

  if password == valid_password && user == valid_user
    break
  end
  puts "Authorization failed!"
end

puts "Welcome!"
