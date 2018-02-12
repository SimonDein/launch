# Write a method that takes two arguments: the first is the starting number, and the second is the ending number.
# Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz",
# if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# solution 1
def fizzbuzz(start_num, end_num)
  start_num.upto(end_num) do |num|
    if num % 5 == 0 && num % 3 == 0
      puts "FizzBuzz"
    elsif num % 3 == 0 then puts "Fizz"
    elsif num % 5 == 0 then puts "Buzz"
    else puts num
    end
  end
end

# solution 2
def fizzbuzz_value(num)
  case
  when num % 5 == 0 && num % 3 == 0
    'FizzBuzz'
  when num % 3 == 0
    'Fizz'
  when num % 5 == 0
    'Buzz'
  else
    num
  end
end

def fizzbuzz(start_num, end_num)
  values = []
  start_num.upto(end_num) do |num|
    values << fizzbuzz_value(num)
  end
  puts values
end

fizzbuzz(1, 15)