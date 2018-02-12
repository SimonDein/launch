# Example on the basic structure of exception handling in Ruby


begin
# Begin some dangerous operation

rescue
# If the operation fails
# Do this instead (fx log the error)
end


# Example of handling a 'nil-value' that has made the way into our program

names = ['bob', 'joe', 'steve', nil, 'frank']

names.each do |name|
  begin
    puts "#{name}'s name has #{name.length} letters in it."
  rescue
    puts "Something went wrong!"
  end
end
