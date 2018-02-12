# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original but -
# where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |hsh|
  updated_hash = {}

  hsh.each do |key, val|
    updated_hash[key] = val + 1
  end
  updated_hash
end # => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]

arr # => [{:a=>1}, {:b=>2, :c=>3}, {:d=>4, :e=>5, :f=>6}] The original has NOT been mutated
