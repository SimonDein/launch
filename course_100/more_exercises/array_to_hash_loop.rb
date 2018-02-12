# 14. In exercise 12, we manually set the contacts hash values one by one
# Now, programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data

contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

def array_to_hash(arr, hash)
  hash.each_key do |key|
    idx = 0
    [:email, :address, :phone].each do |detail|
      hash[key][detail] = arr[idx]
      idx += 1
    end
  end
end



p array_to_hash(contact_data, contacts)
