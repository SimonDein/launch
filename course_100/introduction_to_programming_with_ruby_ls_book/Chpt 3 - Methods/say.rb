# say.rb - methods explained along with an example

# Setting a default value for the parameter in case no argument is passed to the method.
def say(words='Hello')
  puts words
end


say               # returns 'Hello' as it's a defautl value is set no arguments are given.
say
say "how are you" # returns "how are you" - as an argument is passed and changes the default value set for the parameter
say "i'm fine"
