class MiniLangRuntimeError < RuntimeError; end
class BadTokenErorr < MiniLangRuntimeError; end
class EmptyStackError < MiniLangRuntimeError; end

class Minilang
  ACTIONS = %w[PUSH ADD SUB MULT DIV MOD POP PRINT]
  
  
  def initialize(program)
    @program = program
    @register = 0
    @stack = []
  end

  def eval
    program.split.each { |token| eval_token(token) }
  end

  private

  attr_accessor :register
  attr_reader :program, :stack

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif /[1-9]/ =~ token
      self.register = token.to_i
    else
      raise BadTokenErorr
    end
  end

  def push
    stack.push(register)
  end

  def pop
    raise EmptyStackError if stack.empty?
    self.register = stack.pop
  end

  def add
    self.register = register + pop
  end

  def sub
    self.register = register - pop
  end

  def mult
    self.register = register * pop
  end

  def div
    self.register = register / pop
  end

  def mod
    self.register = register % pop
  end
  
  def print
    puts register
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)