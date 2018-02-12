=begin
Description:

Twenty one is a game consisting of a player and a dealer

- The dealer and the player is dealt two cards from the deck
  - the dealer has once card face up / the player has all face up

- The player is asked whether he/she wants to 'hit' or 'stay' until he/she stays
  - if hit
    - the player is dealt another card
    - if player busted?
      - the player lost
    - else the turn goes on
  - else the turn goes to the dealer (implicit 'stay')

- if the value of dealers hand is < 17
  - dealer 'hits'
    - the dealer is dealt another card
    - if he busts
      - player wins
    - else the turn goes on
- else dealer stays

- if dealer hand == player hand
  - it's a tie
- elsif player hand > dealer hand
  - player won
- elsif player hand < dealer hand
  - dealer won

Nouns: deck, card, hand, player, dealer, hand value, game
Verbs: busted?, hit, stay, deal card, wins, looses, tie

Organized into groups:
Player
- hit
- stay
- busted?
- hand
- hand_value

Dealer
- hit
- stay
- busted?
- hand
- hand_value
- deal (should be here or in Deck?)

Deck
- deal (should be here or in Dealer?)

Card
- value (should this belong to card or hand?)

Game
- start
=end