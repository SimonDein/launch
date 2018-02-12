# Proc example

talk = Proc.new do
  puts "the proc is talking"
end

talk.call


talk2 = Proc.new do |name|
  puts "Hey what's up #{name}"
end

talk2.call "Viktor"
