# Write a program that checks if the sequence of characters "lab" exists in the following strings
# If it does exist, print out the word

def check_for_lab(str)
  if str.downcase =~ /lab/ # downcase makes sure the method won't be case sensitive
    puts str
  end
end


check_for_lab("laboratory")
check_for_lab("experiment")
check_for_lab("Pans Labyrinth")
check_for_lab("elaborate")
check_for_lab("polar bear")
