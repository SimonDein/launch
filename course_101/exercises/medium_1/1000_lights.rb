# You have a bank of switches before you numbered from 1 to 1000.
# Each switch is connected to exactly one light that is initially off. You walk down the row of switches, and turn every one of them on.
# Then, you go back to the beginning and toggle switches 2, 4, 6, and so on.
# Repeat this for switches 3, 6, 9, and so on, and keep going until you have been through 1000 repetitions of this process.

# Write a program that determines which lights are on at the end.

LIGHT_BULB_COUNT = 1000

ON = 'on'
OFF = 'off'

# helper methods
def switch_state(state)
  state == ON ? OFF : ON
end

def lights_on(bulbs)
  bulbs.select { |num, value| value == ON}.map { |num, val| num}.flatten
end

def switch_on_or_off(bulbs)
  1.upto(LIGHT_BULB_COUNT) do |count|
    bulbs[(count - 1)..-1].each do |bulb|
      if bulb[0] % count == 0
        bulb[1] = switch_state(bulb[1])
      end
    end
  end
end

# -------

light_bulbs = []
1.upto(LIGHT_BULB_COUNT) {|number| light_bulbs << [number, OFF]} # create bulbs => [bulb_num, state]
switch_on_or_off(light_bulbs)
bulbs_on = lights_on(light_bulbs)

puts "With #{LIGHT_BULB_COUNT} bulbs the result is: #{bulbs_on[0..-2].join(', ')} and #{bulbs_on[-1]}"