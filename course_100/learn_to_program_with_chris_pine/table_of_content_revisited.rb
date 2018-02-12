
toc = ['Table of Contents', 'Chapter 1: Getting Started', 'page 1','Chapter 2: Numbers','page 9',
'Chapter 3: Letters','page 13']

line_w = 60

puts toc[0].center(line_w)
puts toc[1].ljust(line_w / 2) + toc[2].rjust(line_w / 2)
puts toc[3].ljust(line_w / 2) + toc[4].rjust(line_w / 2)
puts toc[5].ljust(line_w / 2) + toc[6].rjust(line_w / 2)
