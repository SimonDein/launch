# Rewrite your program from exercise 3 using a case statement
# Wrap the statement from exercise 3 in a method and wrap this new case statement in a method. Make sure they both still work


# // Old (if/else) //
def evaluate_num_if_else()
  puts "Give me a number between 0 and 100"
  num = gets.chomp.to_i

  if num >= 0 && num < 51
    puts "#{num} is between 0 and 50"
  elsif num > 50 && num <= 100
    puts "#{num} is between 51 and 100"
  elsif num > 100
    puts "#{num} is bigger than 100!"
  else
    puts "#{num} is smaller than 0...try again"
  end
end


# // New (case) //
def evaluate_num_case1()
  puts "Please give me a number between 0 and 100"
  num = gets.chomp.to_i

  case
  when num < 0
    puts "#{num} is smaller than 0...try again"
  when num < 51
    puts "#{num} is between 0 and 50"
  when num <= 100
    puts "#{num} is between 51 and 100"
  else
    puts "#{num} is bigger than 100!"
  end
end


# // Another case option
# Here with a different take on the else - splitting into a fork
def evaluate_num_case2()
  puts "Please give me a number between 0 and 100"
  num = gets.chomp.to_i

  case num
  when 0..50
    puts "#{num} is between 0 and 50"
  when 51..100
    puts "#{num} is between 51 and 100"
  else
    if num < 0
      puts "#{num} is smaller than 0 - try again"
    else
      puts "#{num} is bigger than 100!"
    end
  end
end


# calling methods
evaluate_num_if_else()
evaluate_num_case1()
evaluate_num_case2()
