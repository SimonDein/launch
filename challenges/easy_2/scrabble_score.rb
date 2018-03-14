

=begin
Approach:
  - Split string into characters (consider edge cases: spaces, non-letters)
  - Reduce characters to final scrabble value (accumulate each letters value and return sum)
=end

class Scrabble
  attr_reader :word

  SCRABBLE_VALUES = {
    'aeioulnrst' => 1,
    'dg'         => 2,
    'bcmp'       => 3,
    'fhvwy'      => 4,
    'k'          => 5,
    'jx'         => 8,
    'qz'         => 10
  }
  
  def initialize(word)
    @word = word.is_a?(String) ? word.strip.downcase : ''
  end

  def self.score(word)
    new(word).score
  end
  
  def score
    SCRABBLE_VALUES.keys.inject(0) do |memo, letters|
      memo += word.count(letters) * SCRABBLE_VALUES[letters]
    end
  end
end