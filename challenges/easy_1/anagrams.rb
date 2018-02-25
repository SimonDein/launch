=begin
Description:
Write a program that, given a word and a list of possible anagrams, selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists" "google" "inlets" "banana" the program should return a list containing "inlets". Please read the test suite for exact rules of anagrams.
------------------------------------

Breaking down the problem:
Input:
  - Anagram.new(*arg) takes a single string argument
  
Output:
  - Anagram#match returns a list containing all anagrams matching input
  
Datastructure:
  - I'll keep the argument as array of strings
    - Regexp will be at the core of a succint solution and i see no reason
      to split the strings or or do much transformation.

Approach:
  - This exercise doesn't call for more than iterating over the array of possible
    anagrams while selecting any entries matching regexp (or the like) of word given.
=end

class Anagram
  attr_reader :sorted_letters, :input
  
  def initialize(input)
    @input = input
    @sorted_letters = input.downcase.split('').sort
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  def anagram?(word)
    word = word.downcase
      # fx. 'turtle' is not an angragram for 'turtle' (they're the same) but 'rutlet' is.
      word != input && word.split('').sort == sorted_letters
  end
end