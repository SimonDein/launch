# Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


# solution 1
first_name_with_Be = nil

flintstones.each_with_index do |name, index|
  if name[0, 2] == 'Be'
    first_name_with_Be ||= index
  end
end

p first_name_with_Be

# solution 2
first_name_with_Be = flintstones.index { |name| name[0, 2] == 'Be'}
p first_name_with_Be
