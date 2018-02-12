SUITS = ['H', 'D', 'C', 'S']
TYPES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
GAME = 21
DEALER_LIMIT = GAME - 4

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def initiliaze_deck
  SUITS.product(TYPES).shuffle
end

def deal_cards(hand, deck, cards_dealt=1)
  cards_dealt.times { hand << deck.sample }
end

def joinor(hand)
  case hand.length
  when 2 then "#{hand[0]} and #{hand[1]}"
  else "#{hand[0, (hand.length - 1)]} and #{hand[-1]}"
  end
end

def show_table(player_hand, player_value, dealer_hand)
  puts ""
  puts "Dealer has: #{dealer_hand[0]} and an unknown card"
  puts "Value: ?"
  puts "----------------------------------"
  puts "You have: #{joinor(player_hand)}"
  puts "Value: #{player_value}"
end

def value(cards)
  total = 0
  values = cards.map { |card| card[1] }

  values.each do |value|
    if value.to_i > 0
      total += value.to_i
    elsif %w[J Q K].include?(value)
      total += 10
    end
  end

  values.count('A').times do |counter|
    if total + (counter + 1) > (GAME - 10)
      total += 1
    else
      total += 11
    end
  end

  total
end

def busted?(hand_value)
  hand_value > GAME
end

def choose_action
  loop do
    prompt "Would you like to (h)it or (s)tay?"
    answer = gets.chomp.downcase

    if %w[s h].include?(answer)
      return answer
    else
      puts "'#{answer}' is not a valid choice - please choose by entering 'h' or 's'"
    end
  end
end

def detect_result(player_value, dealer_value)
  if player_value > GAME then :player_busted
  elsif dealer_value > GAME then :dealer_busted
  elsif player_value > dealer_value then :player_won
  elsif player_value < dealer_value then :dealer_won
  else :tie
  end
end

def display_result(player_value=nil, dealer_value=nil)
  result = detect_result(player_value, dealer_value)

  case result
  when :player_busted then prompt "You busted! The dealer wins!"
  when :dealer_busted then prompt "The dealer busted! You win!"
  when :player_won then prompt "You win by highest cards!"
  when :dealer_won then prompt "The dealer wins by highest cards!"
  when :tie then prompt "It's a tie!"
  end
end

def reveal_hands(show_hands="both", player_hand=nil, player_value=nil, dealer_hand=nil, dealer_value=nil)
  case show_hands
  when "both"
    puts "Dealer had: #{joinor(dealer_hand)}"
    puts "Value: #{dealer_value}"
    puts "----------------------------------"
    puts "You had: #{joinor(player_hand)}"
    puts "Value: #{player_value}"
  when "player"
    puts "You had: #{joinor(player_hand)}"
    puts "Value: #{player_value}"
  when "dealer"
    puts "Dealer had: #{joinor(dealer_hand)}"
    puts "Value: #{dealer_value}"
  end
end

def play_again?(loop_type='round')
  answer = nil
  loop do
    prompt "Would you like to play another #{loop_type}? Enter (y)es or (n)o"
    answer = gets.chomp.downcase
    break if %w[y n].include?(answer)
    puts "#{answer} is not an option - please enter one of the letters in the parenthesis"
  end

  answer == 'y'
end

def show_score(player_score, dealer_score)
  puts "Dealer: #{dealer_score}/5 | Player: #{player_score}/5"
end

def detect_winner(player_score, dealer_score)
  if player_score >= 5 || dealer_score >= 5
    if player_score >= 5
      "player"
    else
      "computer"
    end
  end
end

def display_winner(winner)
  puts ''
  case winner
  when "player"
    prompt "******** You won the game! ********"
  when "computer"
    prompt "******** You lost the game! ********"
  end
  puts ""
end

def someone_won?(player_score, dealer_score)
  !!detect_winner(player_score, dealer_score)
end

def press_to_continue
  prompt "Press ENTER to continue"
  gets.chomp
end

# ------------- MAIN PROGRAM -------------
clear_screen
puts "<<|| WELCOME TO A GAME OF #{GAME} ||>>"
puts''
press_to_continue

loop do
  player_score = 0
  dealer_score = 0

  loop do
    player_hand = []
    dealer_hand = []
    deck = initiliaze_deck

    deal_cards(player_hand, deck, 2)
    deal_cards(dealer_hand, deck, 2)
    player_total = value(player_hand)
    dealer_total = value(dealer_hand)

    clear_screen

    loop do # players turn
      show_score(player_score, dealer_score)
      show_table(player_hand, player_total, dealer_hand)
      choice = choose_action

      if choice == 'h'
        deal_cards(player_hand, deck, 1)
      end

      player_total = value(player_hand)
      clear_screen
      break if choice == 's' || busted?(player_total)
    end

    if busted?(player_total) # If player busts
      dealer_score += 1
      show_score(player_score, dealer_score)
      display_result(player_total, dealer_total)
      reveal_hands("player", player_hand, player_total)

      break if someone_won?(player_score, dealer_score)
      press_to_continue
      next
    end

    loop do # Dealers turn
      dealer_total = value(dealer_hand)
      break if dealer_total >= DEALER_LIMIT || busted?(dealer_total)
      deal_cards(dealer_hand, deck, 1)
    end

    if busted?(dealer_total) # If dealer busts
      player_score += 1
      show_score(player_score, dealer_score)
      display_result(player_total, dealer_total)
      reveal_hands("dealer", nil, nil, dealer_hand, dealer_total)

      break if someone_won?(player_score, dealer_score)
      press_to_continue
      next
    end

    case detect_result(player_total, dealer_total)
    when :player_won then player_score += 1
    when :dealer_won then dealer_score += 1
    end

    show_score(player_score, dealer_score)
    display_result(player_total, dealer_total)
    reveal_hands("both", player_hand, player_total, dealer_hand, dealer_total)

    someone_won?(player_score, dealer_score) ? break : press_to_continue
  end

  show_score(player_score, dealer_score)
  display_winner(detect_winner(player_score, dealer_score))
  break unless play_again?("game")
end

clear_screen
prompt "Thanks for playing - take care!"
