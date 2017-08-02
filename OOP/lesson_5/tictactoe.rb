class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 8], [3, 5, 7]]
  def initialize
    @squares = {}
    reset
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winner_marker
  end

  def winner_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(value, marker)
    @squares[value].marker = marker
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts ""
    puts "     |     |     "
    puts "  #{@squares[1]}  |   #{@squares[2]}  |  #{@squares[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  "
    puts "     |     |     "
  end

  private

  def three_identical_markers(squares)
    markers = squares.select(&:marker?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class Square
  INIT_MARKER = " "
  attr_accessor :marker

  def initialize(marker=INIT_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INIT_MARKER
  end

  def marker?
    marker != INIT_MARKER
  end
end

class TTTgame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @turn = FIRST_TO_MOVE
    @computer_score = 0
    @human_score = 0
  end

  def play
    display_welcome_message
    loop do
      loop do 
        display_board
        loop do
          current_player_move
          break if board.someone_won? || board.full?
          clear_screen_and_display_board if human_turn?
          display_score
        end
        display_result
        break if game_won?
        reset
      end
      display_score
      break unless play_again?
      reset
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thank you for playing Tic Tac Toe! Goodbye!"
  end

  def sys_clear
    system 'clear'
  end

  def display_board
    puts "You chose #{human.marker} and the computer chose #{computer.marker}"
    board.draw
  end

  def clear_screen_and_display_board
    sys_clear
    display_board
  end

  def joiner(array, delim, word = 'or')
    case array.size
    when 0 then ""
    when 1 then array.first
    when 2 then array.join(" #{word} ")
    else
      array[-1] = "#{word} #{array.last}"
      string = array.join(delim)
    end
    string
  end

  def human_moves
    puts "Choose a square between #{joiner(board.unmarked_keys, ', ')}:"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Incorrect choice. Choose between #{joiner(board.unmarked_keys, ', ')}"
    end
    board[square] = human.marker
  end

  def find_at_risk_square(line, board)
    if board.values_at(*line).count(HUMAN_MARKER) == 2
      board.select {|k,v| line.include?(k) && v == ' '}.keys.first
    else
      nil
    end
  end

  def computer_moves
    square = board.unmarked_keys.sample
    board[square] = computer.marker
  end

  def display_result
    clear_screen_and_display_board
    case board.winner_marker
    when HUMAN_MARKER
      @human_score += 1
      puts "Human won the round"
    when COMPUTER_MARKER
      @computer_score += 1
      puts "computer won the"
    else
      p "The board is full, Tie game."
    end
  end

  def display_score
    if @human_score == 5
      puts "Human has won the game"
    elsif @computer_score == 5
      puts "computer has won the game"
    else
      puts "Human score: #{@human_score} Computer score: #{@computer_score}"
    end
  end

  def game_won?
    @human_score == 5 || @computer_score == 5
  end

  def play_again?
    puts "Do you want to play again?"
    answer = nil
    loop do
      answer = gets.chomp.downcase
      break if %w[y n].include? answer
      puts "select y or n"
    end
    answer == 'y'
  end

  def reset
    board.reset
    @turn = FIRST_TO_MOVE
    sys_clear
    puts "Let's play again"
    puts ""
  end

  def current_player_move
    if @turn == HUMAN_MARKER
      human_moves
      @turn = COMPUTER_MARKER
    else
      computer_moves
      @turn = HUMAN_MARKER
    end
  end

  def human_turn?
    @turn == HUMAN_MARKER
  end
end

game = TTTgame.new
game.play
