

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

num1 = nil
num2 = nil

loop do
  loop do
    puts ">> Please enter a number:"
    num1 = gets.chomp
    break if valid_number?(num1)
    puts "Please enter a positive or negative integer"
  end

  loop do
    puts ">> Please enter another number:"
    num2 = gets.chomp
    break if valid_number?(num2)
    puts "Please enter a positive or negative integer"
  end

  num1 = num1.to_i
  num2 = num2.to_i


  if num1 > 0 && num2 < 0 || num1 < 0 && num2 > 0
    break
  end
  puts "One number has to be positive and the other negative - try again"
end

puts "#{num1} + #{num2} = #{num1 + num2}"
