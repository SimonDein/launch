
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift # goes front->back - #pop to do the opposite: back->front
  break if names.empty? # could have used "names.lengt == 0"
end
