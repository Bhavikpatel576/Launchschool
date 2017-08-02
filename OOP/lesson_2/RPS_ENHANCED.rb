
require 'pry'

# Rock paper scissors is a two person game where each player chooses Rock, Paper, or Scissors. 
# the first player makes a choice, and then the second player makes a choice
# a winner is displayed after choices have been made. 

# How to change this into an object oriented framework?
# => Classes: 1. Player class 2. Move class 3. Operation class 4. Game Engine
# => Inheritance 
# => 

# pasic sun set_name
# PS3102288664TT

class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def >(other_move)
    if rock?
      return true if other_move.scissors?
      return true if other_move.lizard?
      return false
    elsif paper?
      return true if other_move.rock?
      return true if other_move.spock?
      return false
    elsif scissors?
      return true if other_move.paper?
      return true if other_move.lizard?
      return false
    elsif lizard?
      return true if other_move.paper?
      return true if other_move.spock?
      return false
    elsif spock?
      return true if other_move.rock?
      return true if other_move.scissors?
      return false
    end
  end

  def <(other_move)
    if rock?
      return true if other_move.paper?
      return true if other_move.spock?
      return false
    elsif paper?
      return true if other_move.scissors?
      return true if other_move.lizard?
      return false
    elsif scissors?
      return true if other_move.rock?
      return true if other_move.spock?
      return false
    elsif spock?
      return true if other_move.paper?
      return true if other_move.lizard?
      return false
    elsif lizard?
      return false if other_move.rock?
      return false if other_move.scissors?
    end
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do 
      puts "whats your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do 
      puts "Please choose rock, paper, scissors, lizard, spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappy', 'Wallie'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

end

#Game orchestration engine
class RPSGame
  attr_accessor :human, :computer

  def initialize 
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock Paper Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard Spock!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."

    if human.move > computer.move
      puts "#{human.name} won!"
    elsif human.move < computer.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (y/n)?"
      answer = gets.chomp
      break if ['y','n'].include?(answer)
      puts "Sorry, must be y or n"
    end
    return true if answer == 'y'
    return false
  end

  def play
    display_welcome_message
    loop do 
      human.choose
      computer.choose
      display_winner
      display_goodbye_message
      break unless play_again?
    end
  end
end

RPSGame.new.play
