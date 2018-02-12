def select_letter(string, letter_to_select)
  selected_letters = ''
  counter = 0

  loop do
    break if counter >= string.size

    current_letter = string[counter]

    if current_letter == letter_to_select
      selected_letters << current_letter
    end

    counter += 1
  end

  selected_letters
end



question = 'How many times does a particular character appear in this sentence?'
p select_letter(question, 'a') # => "aaaaaaaa"
p select_letter(question, 't') # => "ttttt"
p select_letter(question, 'z') # => ""
