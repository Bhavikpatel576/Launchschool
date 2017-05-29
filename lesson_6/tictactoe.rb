require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

computer_score = 0
player_score = 0

def prompt(message)
  p "#{message}"
end

def joinor(array, character = ' ', word = 'or')
  len = array.size - 1
  case len
  when 0 then ''
  when 1 then array.first
  when 2 then array.join(" #{word} ")
  else
    array[-1] = "#{word} #{array.last}" # joins the last element as one word
    array.join(character)
  end
end


# rubocop:disable Metrics/AbcSize
def show_board(board)
  system 'clear'
  p "         |          |          "
  p "    #{board[0]}    |    #{board[1]}     |    #{board[2]}     "
  p "         |          |          "
  p "---------|----------|----------"
  p "         |          |          "
  p "    #{board[3]}    |    #{board[4]}     |    #{board[5]}     "
  p "         |          |          "
  p "---------|----------|----------"
  p "         |          |          "
  p "    #{board[6]}    |    #{board[7]}     |    #{board[8]}     "
  p "         |          |          "
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def initialize_board
  board = {}
  (0..8).each { |num| board[num] = INITIAL_MARKER }
  board
end

def player_places_piece(brd)
  square = ''
  loop do
    prompt "Choose a square #{empty_squares(brd).join(', ')}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Choose another spot"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full(brd)
  empty_squares(brd) == []
end

def someone_won?(brd)
  !!detect_round_winner(brd)
end

def game_win?(brd, player_score, computer_score)
  !!detect_winner(brd, player_score, computer_score)
end

def detect_round_winner(brd)
  winning_lines = [[0, 1, 2], [3, 4, 5], [6, 7, 8]] +
                  [[0, 3, 6], [1, 4, 7], [2, 5, 8]] +
                  [[0, 4, 7], [2, 4, 6]]
  winning_lines.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def detect_winner(brd, player_score, computer_score)
  if player_score == 5
    return 'Player'
  elsif computer_score == 5
    return 'Computer'
  end
  nil
end

def score_count(brd, player_score, computer_score)
  if detect_round_winner(brd) == 'Player'
    player_score += 1
  elsif detect_round_winner(brd) == 'Computer'
    computer_score += 1
  end
  
end


loop do
  board = initialize_board
  loop do 
    #incorrect loop system - bp
    show_board(board)
    player_places_piece(board)
    break if someone_won?(board) || board_full(board)
    computer_places_piece(board)
    break if someone_won?(board) || board_full(board)
  end

  if detect_round_winner(board) == 'Player'
    player_score += 1
  elsif detect_round_winner(board) == 'Computer'
    computer_score += 1
  end

  show_board(board)
  prompt "Computer Score - #{computer_score} vs. player_score - #{player_score}"

  if someone_won?(board)
    prompt "#{detect_round_winner(board)} won the round!"
  else
    prompt "It's a tie this round!"
  end

  if player_score == 5 || computer_score == 5
    (player_score == 5) ? (prompt "Player has won") : (prompt "Computer has won")
    prompt 'Play again? Yes or No'
    answer = gets.chomp.downcase
    break if answer == 'no'
  end
end

prompt 'thanks for playing the game that i made up competely myself'
