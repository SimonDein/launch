SUITS = ['H', 'D', 'C', 'S']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def play_again?
  answer = nil
  loop do
    prompt "Would you like to play again? (y)es or (n)o"
    answer = gets.chomp.downcase
    break if %w[y n].include?(answer)
    puts "That's not a legit choice - try again"
  end

  true if answer == 'y'
end

def value(cards)
  values = cards.map { |card| card[1]}

  total = 0
  values.each do |value|
    if value.to_i > 0
      total += value.to_i
    elsif value == 'A'
      total += 11
    else
      total += 10
    end
  end

  # Update values of aces depending on the total value of hand
  values.count('A').times { |_| total -= 10 if total > 21 }

  total
end

def busted?(cards)
  value(cards) > 21
end

def detect_result(player_hand, dealer_hand)
  player_total = value(player_hand)
  dealer_total = value(dealer_hand)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif player_total > dealer_total
    :player_won
  elsif player_total < dealer_total
    :dealer_won
  else
    :tie
  end
end

def display_result(player_hand, dealer_hand)
  result = detect_result(player_hand, dealer_hand)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :computer_busted
    prompt "Dealer busted! You win!"
  when :player_won
    prompt "You win!"
  when :dealer_won
    prompt "Dealer win! Better luck next time!"
  when :tie
    prompt "It's a tie!"
  end
end


# ---- MAIN LOOP ------------------
puts "Welcome to 21!"

loop do
  deck = initialize_deck
  player_hand = []
  dealer_hand = []

  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end

  puts "The dealer has: #{dealer_hand[0]} and ?"
  puts "You have: #{player_hand[0]} and #{player_hand[1]}"


  # --- Players turn -------
  loop do
    answer = nil
    loop do
      puts "Would you like to (h)it or to (s)tay"
      answer = gets.chomp.downcase

      break if %(s h).include?(answer)
      puts "#{answer} is not a legit choice - please try again."
    end

    if answer == 'h'
      player_hand << deck.pop
      prompt "You choose hit!"
      puts "Your cards are now: #{player_hand}"
      puts "Your value is now: #{value(player_hand)}"
    end

    break if answer == 's' || busted?(player_hand)
  end

  if busted?(player_hand)
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  else
    puts "You stay at #{value(player_hand)}"
  end

  loop do
    break if value(dealer_hand) >= 17
    dealer_hand << deck.pop
  end

  if busted?(dealer_hand)
    display_result(player_hand, dealer_hand)
    play_again? ? next : break
  else
    puts "Dealer stays at #{value(dealer_hand)}"
  end

  puts "=============="
  prompt "Dealer has #{dealer_hand}, for a total of: #{value(dealer_hand)}"
  prompt "Player has #{player_hand}, for a total of: #{value(player_hand)}"
  puts "=============="

  display_result(player_hand, dealer_hand)

  break unless play_again?
end

puts "Goodbye!"
