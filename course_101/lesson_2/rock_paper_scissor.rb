VALID_CHOICES = %w(rock paper scissors lizard spock)

welcome = <<-MSG
Welcome to a game of:
ROCK, PAPER, SCISSORS, LIZARD AND SPOCK!

- It's best out of 5
- We keep track of the score
- To win - you have to get a better score than the computer

Good luck!

MSG

winning_conditions = {
  rock: ['scissors', 'lizard'],
  paper: ['rock', 'spock'],
  scissors: ['paper', 'lizard'],
  spock: ['scissors', 'rock'],
  lizard: ['paper', 'spock']
}

def prompt(message)
  puts "=> #{message}"
end

def full_name(abbreviation)
  case abbreviation
  when 'r'
    'rock'
  when 'p'
    'paper'
  when 's'
    'scissors'
  when 'l'
    'lizard'
  when 'sp'
    'spock'
  end
end

def won?(first, second, winning_conditions) # check hash for whether the hand you chose will win over the computers choice
  winning_conditions[first.to_sym].include?(second)
end

def display_result(choice, computer_choice, winning_conditions)
  if won?(choice, computer_choice, winning_conditions)
    prompt('You won this round!')
  elsif choice == computer_choice
    prompt("It's a tie!")
  else
    prompt('The computer beat you this round!')
  end
end

prompt(welcome)

loop do # main loop
  round = 0
  player_score = 0
  computer_score = 0

  loop do # game loop
    choice = ''

    loop do
      prompt("------------------------ ROUND #{round + 1}! ------------------------")
      prompt('Choose one: (r)ock, (p)aper, (s)cissors, (l)izard or (sp)ock')
      prompt("Choose a 'hand' by entering the first letter (note 'sp' for spock) - or full name")
      choice = gets.chomp

      if %w(r p s l sp).include?(choice)
        choice = full_name(choice)
      end

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("'#{choice}' is not a valid choice - please try again")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}; computer chose #{computer_choice}")

    display_result(choice, computer_choice, winning_conditions)

    if won?(choice, computer_choice, winning_conditions) # if player wins - add to players score
      player_score += 1
    elsif won?(computer_choice, choice, winning_conditions) # if computer wins - add to computers score
      computer_score += 1
    end

    round += 1
    if round >= 5
      if player_score > computer_score
        prompt("You won the 'best out of five' #{player_score} to #{computer_score}!")
        break
      elsif computer_score > player_score
        prompt("You lost #{computer_score} to #{player_score}!")
        break
      else
        prompt("It's a tie!")
        break
      end
    end
  end

  prompt("Would you like to play again? (Enter 'y' to continue)")
  play_again = gets.chomp
  break unless play_again.upcase == 'Y'
end

prompt('Thanks for playing - goodbye!')
