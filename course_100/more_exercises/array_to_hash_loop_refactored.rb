# 14. Refactored version of array_to_hash_loop.rb that can handle multiple entries in contacts and contact_data


contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}


def array_to_hash(arr, hash)
  hash.each_pair do |key, val|
    data = arr.shift
    [:email, :address, :phone].each do |detail|
      hash[key][detail] = data.shift
    end
  end
end

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end


p array_to_hash(contact_data, contacts)
