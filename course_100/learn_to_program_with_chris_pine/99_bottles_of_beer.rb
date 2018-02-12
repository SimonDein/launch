num = 99

while num > 0
  if num > 1
    puts "#{num} bottles of beer on the wall, #{num} bottles of beer. Take one down and pass it around"
    num -= 1
  else
    puts "1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more beer on the wall"
    puts "No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall."
    num -= 1
  end
end
