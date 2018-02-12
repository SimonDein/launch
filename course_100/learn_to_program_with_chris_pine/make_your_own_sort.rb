# Build your own sorting method

# sort(arr) => array
def sort arr
  unsorted_words = arr.clone   # clone the arr so that #delete won't mutate it
  sorted_words = []
  smallest_word = ''

  loop do
    smallest_word = unsorted_words.first   # set the first word to be "smallest_word" to have something to compare to

    unsorted_words.each do |word|      # iterate over still unsorted words
      if word < smallest_word
        smallest_word = word
      end
    end
    sorted_words.push(unsorted_words.delete(smallest_word))    # when the "smallest" word in the array has been found - push it to sorted_words and delete from unsorted_words

    break if unsorted_words.empty?
  end

  sorted_words
end


list_of_words = ["d", "a", "c", "b", "z", "e"]

puts sort(list_of_words)
