# Question 1
# For this practice problem, write a one-line program that creates the following output 10 times,
# with the subsequent line indented 1 space to the right:
10.times {|iteration| puts "#{" " * iteration}The Flintstones Rock!"}


# Question 2
# The result of the following statement will be an error:
puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# It throws an error because you try to add a string with an integer - this can be fixed by:
# Interpolating the numbers inside the string with #{}


# Question 3
def factors(number)
  dividend = number
  divisors = []
  while number > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

# Bonus 1:
# The purpose of the remainder operator (%) is to check if there is anything "left" after the division.
# If not - we can be sure that the number is a factorial of the devidend adn therefore add it to the divisors array.

# Bonus 2:
# When creating a loop using the "begin/end" keywords - there's no stop condition to end the loop until it is constructed.
# The until condition is therefore in place to check when the loop reaches the "end" keyword to check whether it should
# loop again - or not.


# Question 4
# Yes - the first implementation will mutate the 'buffer' - where the second does not alter the input.
# They both return the same value.


# Question 5
def fib(first_num, second_num)
  limit = 15 # The limit variable should be implemented inside of the method - unless we write as an parameter in the method
  # and pass it as an argument when calling.
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"


# Question 6
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

  # //refactored//
def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"  # re-assign (non-mutating)
  an_array_param += ["rutabaga"]  # re-assign instead to not mutate any input in this case

  return a_string_param, an_array_param # explicit return of two objects
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array) # the explicit return from the method returns two
                                                                # objects which we capture.
puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Question 7
# It's going to return 34 as numerics are immutable in Ruby and the only thing altering the original number,
# is the (- 8) on the same line as it is printed.


# Question 8
# The hash will be scrambled i.e. mutated after the call has run. The hash is passed as an argument,
# and the parameter points to the object_id of the original hash - it is NOT reassigned before the method
# starts mutating data in the hash. Integers are immutable - but, in this case - belong to a collection - a hash.
# And elements of a collection - though immutable - CAN change what specific space in memory they point to
# without affecting the specific space in memory the collection itself points to.
# So basically - the hash keeps its ID throughout, but the elements in the hash are changed - and does not.
# Had the hash been re-assigned in the method and then altered - the original hash would have been kept intact.


# Question 9
# => "paper"


# Question 10
# => "no"
