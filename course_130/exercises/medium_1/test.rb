
def first_level
  my_proc = proc { return }
  second_level(my_proc)
  puts "will this show?"
end

def second_level(my_proc)
  my_proc.call
end