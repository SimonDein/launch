=begin
Description:
Write a program that given a phrase can count the occurrences of each word in that phrase.

For example, if we count the words for the input "olly olly in come free", we should get:

olly: 2
in: 1
come: 1
free: 1

Breaking down the problem:

Input
  - A string

Output
  - A hash

Datastrucute:
  - An array of the words in input string
    - That way we can iterate while counting the entries
  - A hash for collecting the result

Approach:
Since arrays has a Array#to_h method i'm going for a solution utalizing that mechanich.
I think that could give a nice and succint solution.

Algorithm:
array = input

array.map {|str1| array.count { |str2| count for str1 == str2 }}
Then remove duplications and return"Joe can't tell between 'large' and large."

=end

class Phrase
  def initialize(input)
    @words = input.downcase.scan(/\b[\w']+\b/) # return an array
  end

  def word_count
    @words.each_with_object(Hash.new(0) ) { |word, word_count| word_count[word] += 1}
  end
end