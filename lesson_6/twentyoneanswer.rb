SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def total(cards)
  # cards = [['H', '3'], ['S', 'Q'], ... ]
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif value.to_i == 0 # J, Q, K
      sum += 10
    else
      sum += value.to_i
    end
  end

  # correct for Aces
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > 21
  end

  sum
end

def busted?(total_card_value)
  total_card_value > 21
end

# :tie, :dealer, :player, :dealer_busted, :player_busted
def detect_result(dealer_cards, player_cards)
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_cards, player_cards)
  result = detect_result(dealer_cards, player_cards)

  case result
  when :player_busted
    prompt "You busted! Dealer wins round!"
  when :dealer_busted
    prompt "Dealer busted! You win round!"
  when :player
    prompt "You win the round!"
  when :dealer
    prompt "Dealer wins the round!"
  when :tie
    prompt "It's a tie the round!"
  end
end

def play_again?
  puts "-------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def winner?(player_win, computer_win)
  if player_win == 5
    prompt "Player wins the game"
  elsif computer_win == 5
    prompt "Computer wins the game"
  else
    prompt "Player has won #{player_win} rounds and Computer has won #{computer_win} rounds"
  end
end

loop do
  prompt "Welcome to Twenty-One!"
  player_win = 0
  computer_win = 0
  game_score = 0
  loop do
    game_score = [player_win, computer_win].max
    break if game_score == 5


    # initialize vars
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    # initial deal
    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    prompt "Dealer has #{dealer_cards[0]} and ?"
    prompt "You have: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}."

    # player turn
    loop do
      player_turn = nil
      #loop until user selects a proper input
      loop do
        prompt "Would you like to (h)it or (s)tay?"
        player_turn = gets.chomp.downcase
        break if ['h', 's'].include?(player_turn)
        prompt "Sorry, must enter 'h' or 's'."
      end

      if player_turn == 'h'
        player_cards << deck.pop
        player_total = total(player_cards)
        prompt "You chose to hit!"
        prompt "Your cards are now: #{player_cards}"
        prompt "Your total is now: #{player_total}"
      end

      break if player_turn == 's' || busted?(player_total)
    end

    if busted?(player_total)
      display_result(dealer_cards, player_cards)
      play_again? ? next : break #1 
    else
      prompt "You stayed at #{player_total}"
    end

    # dealer turn
    prompt "Dealer turn..."

    loop do
      break if dealer_total >= 17

      prompt "Dealer hits!"
      dealer_cards << deck.pop
      dealer_total = total(dealer_cards)
      prompt "Dealer's cards are now: #{dealer_cards}"
    end

    if busted?(dealer_total)
      prompt "Dealer total is now: #{dealer_total}"
      display_result(dealer_cards, player_cards)
      play_again? ? next : break
    else
      prompt "Dealer stays at #{dealer_total}"
    end

    # both player and dealer stays - compare cards!
    puts "=============="
    prompt "Dealer has #{dealer_cards}, for a total of: #{dealer_total}"
    prompt "Player has #{player_cards}, for a total of: #{player_total}"
    puts "=============="

    if detect_result(dealer_cards,player_cards) == :player
      player_win += 1
    elsif detect_result(dealer_cards,player_cards) == :dealer
      computer_win += 1
    end

    display_result(dealer_cards, player_cards)
    winner?(player_win, computer_win)
  end
    break unless play_again?
    #this call to play_again allows us to exit out of the main loop execute the decision 
    #to play the game again or not.

  end

  prompt "Thank you for playing Twenty-One! Good bye!"