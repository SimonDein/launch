# Write a method that returns a list of all substrings of a string.
# The returned list should be ordered by where in the string the substring begins.
# This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on.
# Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.

# You may (and should) use the substrings_at_start method you wrote in the previous exercise:

def substrings_at_start(string)
  sub_strings = []
  1.upto(string.size) do |count|
    sub_strings << string[0, count]
  end

  sub_strings
end

# solution 1
def substrings(string)
  all_sub_strings = []
  0.upto(string.size - 1) do |index|
    all_sub_strings << substrings_at_start(string[index, (string.size - index)])
  end
  all_sub_strings.flatten
end

# solution 2
def substrings(string)
  results = []
  (0..string.size - 1).each do |start_index|
    current_sub_substring = string[start_index..-1]
    results.concat(substrings_at_start(current_sub_substring))
  end
  results
end



p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]