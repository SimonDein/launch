my_proc = proc { return}

def method_1(proc)
  method_2
  puts "will this print"
  proc.call
end

def method_2
  a_proc = proc do
    puts "yo"
    return
  end
  a_proc.call
end

method_1(my_proc)