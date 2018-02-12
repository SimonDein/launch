vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']


def count_occurences(arr)
  h = {}

  arr.each do |word|
    if h.has_key?(word)
      h[word] += 1
    else
      h[word] = 1
    end
  end
  # Print out keys along with their values
  h.each {|k, v| puts "#{k} => #{v}"}
end

count_occurences(vehicles)
