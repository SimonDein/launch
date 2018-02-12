status = ['awake', 'tired'].sample


# The normal if/else version

state = if status == 'awake'
  "Be productive!"
else
  "Go to sleep!"
end

# OR ----

# The ternary operator version:

state = status == 'awake' ? "Be productive!" : "Go to sleep!"

puts state
