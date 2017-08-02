require 'pry'
# #modify this so flip switch and the setter method are private
# class Machine
#   attr_writer :switch

#   def start
#     flip_switch(:on)
#   end

#   def stop
#     flip_switch(:off)
#   end

#   private
#   attr_writer :switch
#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# #Fixed Array
# class FixedArray

#   def initialize(number)
#     @array = Array.new(number)
#   end

#   def [](index)
#     @array.fetch(index)
#   end

#   def []=(index, value)
#     @array[index] = value
#   end

#   def to_a
#     @array.clone
#   end

#   def to_s
#     to_a.to_s
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
#   def initialize(name, year)
#     super
#   end
# end

#Circle Queu
#establish a buffer
# class CircularQueue
#   attr_reader :stack  
#   def initialize(value)
#     @value = value
#     @add_index = 0
#     @delete_index = 0
#     @stack = Array.new(@value)
#   end

#   def dequeue
#     @delete_index = 0 if @delete_index == @value
#     pop = @stack[@delete_index]
#     @stack[@delete_index] = nil
#     @delete_index += 1
#     puts "deleted the element #{pop}, new index is #{@delete_index}"
#     pop
#   end

#   def enqueue(value)
#     @add_index = 0 if @add_index == @value
#     unless @stack[@add_index] == nil
#       increment(@delete_index)
#     end
#     @stack[@add_index]= value
#     puts "stack:#{@stack} add_index: #{@add_index} delete_index: #{@delete_index}"
#     @add_index += 1
#   end

#   def increment(position)
#     position + 1 % @value
#   end
# end

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value

class Minilang
  attr_reader :register, :stack, :program
  ACTION = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  def initialize(program)
    @stack = []
    @register = 0
    @program = program
  end

  def hello(*args)
    p "Hello" + args.join(", ")
  end

  def eval
    self.program.downcase.split.each do |token|
      if ACTION.include?(token)
        send(token)
      elsif token =~ /\A[+-]?\d+\z/
        @register = token.to_i
      else
        puts "issue"
      end
    end
  end

  def push
    @stack.push(register)
  end

  def add
    @register += @stack.pop
  end

  def sub
    @register -= @stack.pop
  end

  def mult
    @register *= @stack.pop
  end

  def div
    @register /= @stack.pop
  end

  def mod
    @register %= @stack.pop
  end

  def pop
    @stack.pop
  end

  def print
    p @register
  end
end

#wrong
Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15
