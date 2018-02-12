# Consider the following class:
# Modify this class so both flip_switch and the setter method switch= are private methods.

# Further Exploration
# Add a private getter for @switch to the Machine class, and add a method to Machine that shows how to use that getter.

class Machine
  def start
    flip_switch(:on)
  end
  
  def stop
    flip_switch(:off)
  end

  def current_state
     puts switch
  end
  
  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
machine.start
p machine
machine.stop
p machine
machine.current_state