
roman_num = Array.new

I = 1
V = 5
X = 10
L = 50
C = 100
D = 500
M = 1000


puts "Give me a number: "
input_num = gets.chomp.to_i

while input_num > 0
  puts input_num
  if input_num > 1

    if input_num / 1000 >= 1
      roman_num.push('M' * (input_num / 1000))
      input_num = input_num % 1000

    elsif input_num / 500 >= 1
      roman_num.push('D' * (input_num / 500))
      input_num = input_num % 500

    elsif input_num / 100 >= 1
      roman_num.push('C' * (input_num / 100))
      input_num = input_num % 100

    elsif input_num / 50 >= 1
      roman_num.push('L' * (input_num / 50))
      input_num = input_num % 50

    elsif input_num / 10 >= 1
      roman_num.push('X' * (input_num / 10))
      input_num = input_num % 10

    elsif input_num / 5 >= 1
      roman_num.push('V' * (input_num / 5))
      input_num = input_num % 5

    else
      roman_num.push('I' * (input_num / 1))
      input_num = input_num % 1
    break
    end

  else
    break
  end
end

puts roman_num.join("")
