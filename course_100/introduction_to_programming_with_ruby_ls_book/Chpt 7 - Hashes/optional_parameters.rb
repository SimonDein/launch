
# Here we set a hash as an optional parameter
def greeting(name, options = {})
  if options.empty?
    puts "Hi, my name is #{name}"
  else
    puts "Hi, my name is #{name}, i'm #{options[:age]} old and live in #{options[:city]}"
  end
end

greeting("Simon", {age: 23, city: "Oslo"})
# => Hi, my name is Simon, i'm 23 old and live in Oslo
