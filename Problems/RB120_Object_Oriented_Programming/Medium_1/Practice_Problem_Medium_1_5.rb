class MinilangError < StandardError; end
class BadTokenError < StandardError; end
class EmptyStack < StandardError; end

class Minilang
  VALID_VALUES = ['ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT', 'PUSH']
  attr_accessor :stack, :register

  def initialize(program)
    @register = 0
    clean_stack(program)
  end

  def clean_stack(program)
    @stack = program.split(' ')
  end

  def eval
    stack.each do |token|
      case token
      when 'ADD'   then add
      when 'DIV'   then div
      when 'MULT'  then mult
      when 'MOD'   then mod
      when 'SUB'   then sub
      when 'PUSH'  then push
      when 'POP'   then pop
      when 'PRINT' then print
      when /\d/ then self.register = token.to_i
      else
        # raise BadTokenError, (puts "invalid token: #{token}") unless VALID_VALUES.include?(token)
      end
    end
  end

  def add
    self.register += stack.pop
  end

  def div
    self.register /= stack.pop
  end

  def mult
    self.register *= stack.pop
  end

  def mod
    self.register %= stack.pop
  end

  def sub
    self.register -= stack.pop
  end

  def push
    stack.push(register)
  end

  def pop
    raise EmptyStackError, "Empty stack!" if stack.empty?
    self.register = stack.pop
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
