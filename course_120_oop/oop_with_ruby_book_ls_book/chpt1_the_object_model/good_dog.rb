module Shit
 def shit
  "Takes a shit"
 end
end

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Shit
  include Speak
  
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors