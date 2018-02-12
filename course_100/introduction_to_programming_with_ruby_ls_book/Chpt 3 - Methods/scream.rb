# 1) Edit the method in exercise #4 so that it does print words on the screen.

# // Exercise method
# def scream(words)
#   words = words + "!!!!"
#   return
#   puts words
# end

# scream("Yippeee")



# "fixed" method
def scream(words)
  words = words + "!!!!"
  puts words
  return
end

scream("Heeeeey")


# 2) What does it return now?

# The code will now print the words including exclamation marks - but RETURNS nil
# It returns "nil" as we simply set it to return without "handing anything over" - i.e. it returns nothing
# !! This has nothing to do with the "puts" method - nil is returned as we don't tell it to return anything, which == nil
