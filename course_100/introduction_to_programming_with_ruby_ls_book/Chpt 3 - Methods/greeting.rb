# Write a program that prints a greeting message
# This program should contain a method called greeting that takes a name as its parameter and returns a string.

def greeting(name)
  "Good to see you #{name}"
end

# Calling this method will return the full string with the name interpolated
# Nothing is seen when the program is run as we do not print or puts it
greeting("Simon")
