# Take everything you've learned so far and build a mortgage calculator (or car payment calculator -- it's the same thing).

# You'll need three pieces of information:
# - the loan amount
# - the Annual Percentage Rate (APR)
# - the loan duration

welcome = <<-MSG
Welcome to the Mortgage Calculator!

You'll be asked to enter some information about your loan,
and i'll tell you how much your montly payment should be.

MSG

def validate_num
  loop do
    n = gets.chomp
    if n.empty? || n.to_f <= 0
      puts "The entered amount has to be bigger than 0"
    else
      return n
    end
  end
end

def string?
  loop do
    s = gets.chomp
    if s.to_i.to_s != s  && !s.empty?
      return s
    end
    puts "#{s} is a number - please enter the notation of your currency as shown in the example"
  end
end

# ----------- MORTGAGE CALCULATOR -----------
puts welcome

loop do # main loop
  puts "What currency is the loan in? (shorthand - example: USD, DKR, Euro...)"
  currency = string?().upcase

  puts "How big is your loan? (Enter full amount)"
  loan_amount = validate_num().to_i

  puts "What is the APR on the loan? (Annual Percentage Rating - can be with decimals)"
  apr = validate_num().to_f       # Annual Percentage Rating converted to be used in the formula
  mpr = apr / 12 / 100            # Montly Percentage Rating

  puts "What is the duration of the loan? (In years - can be a decimal)"
  loan_in_years = validate_num().to_f
  loan_in_months = loan_in_years * 12

  # Formula calculating the monthly payment for the loan
  monthly_payment = loan_amount * (mpr / (1 - (1 + mpr)**(-loan_in_months)))

  puts"
  ----- LOAN OVERVIEW -----

  Loan Amount: #{loan_amount},- #{currency}
  Loan Duration: #{loan_in_years} years
  Annual Percentage Rating: #{apr}%

  Your monthly payment to meet the loan should be:
  #{monthly_payment},- #{currency}"

  puts "
  Would you like to do another calculation? (Enter 'Y')"

  answer = gets.chomp
  break if answer.upcase != 'Y'
end
