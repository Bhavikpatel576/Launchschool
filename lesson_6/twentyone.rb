# rubocop:disable Metrics/LineLength
DECK_VALUE = { "A" => 11, "K" => 10, "Q" => 10, "J" => 10, "10" => 10, "9" => 9, "8" => 8, "7" => 7, "6" => 6, "5" => 5, "4" => 4, "3" => 3, "2" => 2 }

def prompt(message)
  p "#{message}"
end

def joinor(array)
  message = ''
  array.each do |a|
    message << "#{a[1]} of #{a[0]}, "
  end
  message
end

def initialize_deck
  face_cards = %w[A K Q J 10 9 8 7 6 5 4 3 2]
  deck = []
  suits = %w[Hearts Diamonds Spades Clovers]
  face_cards.each do |fc|
    suits.each do |type|
      deck << [type, fc]
    end
  end
  deck
end

def deal_cards(card_deck, num_cards)
  dealer_cards = []
  player_cards = []
  loop do
    dealer_card = card_deck.sample
    card_deck.delete(dealer_card)
    dealer_cards << dealer_card
    # player cards
    player_card = card_deck.sample
    card_deck.delete(player_card)
    player_cards << player_card
    num_cards -= 1
    break if num_cards == 0
  end
  return dealer_cards, player_cards
end

def gameplay
  prompt("Dealer has #{dealer_cards[0]} and an unknown card")
  prompt("Player has #{player_cards[0]} and #{player_cards[1]}")
end

def value(array)
  DECK_VALUE[array[1]]
end

def total_values(dealer_cards, player_cards)
  # sum values of all cards. use the ace method to determine the value of ace
  dealer_total = 0
  player_total = 0
  dealer_cards.each do |card|
    dealer_total += value(card).to_i
  end

  player_cards.each do |card|
    player_total += value(card).to_i
  end

  dealer_cards.select { |v| v == 'A' }.count.times do
    dealer_total -= 10 if dealer_total > 21
  end

  player_cards.select { |v| v == 'A' }.count.times do
    player_total -= 10 if dealer_total > 21
  end

  return dealer_total, player_total
end

def show_cards(dealer_cards, player_cards)
  # show the cards for dealer and player
  _, player_tot = total_values(dealer_cards, player_cards)
  prompt("Dealer has #{joinor(dealer_cards)} and an unknown card")
  prompt("Player has #{joinor(player_cards)}. Total score: #{player_tot}")
end

def hit(card_deck, hand_of_cards)
  card = card_deck.sample
  # ********does this work outside the method scope?************
  card_deck.delete(card)
  hand_of_cards << card
  hand_of_cards
end

def bust(dealer_cards, player_cards, which_player)
  d_tot, p_tot = total_values(dealer_cards, player_cards)
  case which_player
  when 'Dealer'
    if d_tot > 21
      return true
    end
  when 'Player'
    if p_tot > 21
      return true
    end
  end
  false
end

def show_winner(dealer_cards, player_cards)
  d_tot, p_tot = total_values(dealer_cards, player_cards)
  if bust(dealer_cards, player_cards, 'Dealer')
    prompt 'Dealer Busted'
  elsif d_tot > p_tot
    prompt 'Dealer Wins!'
  elsif p_tot > d_tot
    prompt 'Player Wins!'
  else
    prompt 'Tie Game'
  end

  prompt("Dealer has #{joinor(dealer_cards)}. Total score: #{d_tot}")
  prompt("Player has #{joinor(player_cards)}. Total score: #{p_tot}")
end

def computer_decision(card_deck, dealer_cards, player_cards)
  loop do
    d_tot, = total_values(dealer_cards, player_cards)
    break if d_tot > 17
    hit(card_deck, dealer_cards)
  end
end

loop do 
  prompt 'Welcome to the game 21!'
  card_deck = initialize_deck
  dealer_cards, player_cards = deal_cards(card_deck, 2)

  # show the cards
  show_cards(dealer_cards, player_cards)
  loop do
    # player choice
    p 'Would you like to hit? Yes or No'
    hit = gets.chomp.to_s.downcase
    break if hit == 'no'
    # update deck
    hit(card_deck, player_cards)
    # show the cards
    show_cards(dealer_cards, player_cards)
    system 'clear'
    # check game status
    break if bust(dealer_cards, player_cards, 'Player')
  end
  if bust(dealer_cards, player_cards, 'Player')
    prompt 'Player busted'
    prompt 'Play again?'
    play_again = gets.chomp.to_s.downcase
    break if play_again == 'no'
  else
    # computer algo choice/choices 
    computer_decision(card_deck, dealer_cards, player_cards)
    # Show winner
    show_winner(dealer_cards, player_cards)
    prompt  'Play again?'
    play_again = gets.chomp.to_s.downcase
    break if play_again == 'no'
  end
end

