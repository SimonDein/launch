=begin
Breaking down the problem:

Input
  - Integer representing verse
  or
  - Two integers representing a range of verses

Output
  - String

Data structure for output
  - A string will hold the lyrics to be returned by the methods.

Approach
  There are three different "types" of verses all depending on how many bottles are left - 99..2, 1, 0.
  Two methods are called in the test cases - #verse and #verseS

  Any new BeerSong object should have a @lyrics ivar holding onto all of the lyrics.
  Then we can retrieve any verses that we'd like depending on the argument(s) and the method called.
=end

class BeerSong
  attr_accessor :song_text
  
  def initialize
    @song_text = generate_song_text
  end

  def verse(verse_num)
    song_text[verse_num]
  end

  def verses(start_verse=99, end_verse=0)
    song_text[end_verse..start_verse].reverse.join("\n")
  end
  alias_method :lyrics, :verses

  private

  def generate_song_text
    (0..99).to_a.map do |verse_number|
      # binding.pry
      case verse_number
      when 2..99
        "#{verse_number} bottles of beer on the wall, #{verse_number} bottles of beer.\n" \
        "Take one down and pass it around, #{verse_number - 1} bottle#{verse_number == 2 ? '' : 's'} of beer on the wall.\n"
      when 1
        "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      else
        "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
  end
end