# 1. Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr.each {|n| puts n}

puts ""


# 2. Same as above, but only print out values greater than 5.

arr.each {|n| puts n if n > 5}

puts ""


# 3. Now, using the same array from #2, use the select method to extract all odd numbers into a new array.

new_arr = arr.select {|num| num % 2 != 0}

p new_arr


# 4. Append "11" to the end of the original array. Prepend "0" to the beginning

arr.unshift(0)
arr << 11
p arr


# 5. Get rid of "11". And append a "3"

arr.pop
arr.push(3)
p arr

# 6. Get rid of duplicates without specifically removing any one value

p arr.uniq!
