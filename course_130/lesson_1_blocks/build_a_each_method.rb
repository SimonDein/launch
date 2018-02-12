

def each(arr)
  index = 0
  while index < arr.length
    yield(arr[index])
    index += 1
  end
  
  arr
end

each([1, 2, 3]) do |num|
  puts num
end