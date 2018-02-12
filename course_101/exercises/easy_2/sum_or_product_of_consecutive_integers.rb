def get_num
  loop do
    num = gets.chomp.to_i
    if num > 0
      return num
    else
      puts "The number has to be higher than 0"
    end
  end
end

def get_action()
  loop do
    action = gets.chomp
    return action if %w(s p).include?(action)
    puts "#{action} is not a valid action"
  end
end

def get_product(num)
  1.upto(num).inject {|sum, num| sum * num}
end

def get_sum(num)
  1.upto(num).inject { |sum, num| sum + num}
end


# // Main //
puts "Please enter an integer greater then 0"
num = get_num()

puts "Enter 's' to compute the sum, 'p' to compute the product"
action = get_action()

result = case action
when 's'
  action = "sum"
  get_sum(num)
when 'p'
  action = "product"
  get_product(num)
end

puts "The #{action} of the integers between 1 and #{num} is #{result}"
