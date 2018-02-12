def select_vowels(str)
  selected_chars = ''
  counter = 0

  loop do
    current_char = str[counter]

    if 'aeiouAEIOU'.include?(current_char)
      selected_chars << current_char
    end

    counter += 1
    break if counter >= str.size
  end

  selected_chars
end

puts select_vowels('Monkey')
puts select_vowels('Absolutely Insane Scientist')
