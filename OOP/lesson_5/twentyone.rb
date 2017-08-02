#Two players, a dealer and an opponent, are initially handed two cards
#The goal is to get the closest value to 21 without going over

#Noun: Dealer, Player, Cards, Deck, Game, Total
#Verbs: Hit, Stay, Bust

class Participant
  attr_reader :cards

  def initialize
    @cards = Cards.new
  end

  def hit
  end

  def stay
  end

  def busted?(total_card_value)
    total_card_value > 21
  end

  def total(cards)
    #new array ignoring suits
    values = cards.map { |card| card[1]}

    sum = 0
    values.each do |card_value|
      if card_value == 'A'
        sum += 11
      elsif card_value.to_i == 0
        sum += 10
      else
        sum += card_value.to_i
      end
    end

    #correct for ace
    values.select { |face_value| face_value == 'A'}.count.times do
        sum-=10 if sum > 21
    end
    sum
  end
end

class Player < Participant

end

class Dealer < Participant
  def deal
  end
end

class Deck
  SUITS = ['H', 'D', 'S', 'C']
  VALUES = ['2','3','4','5','6','7','8','9', '10', 'J', 'Q', 'K', 'A']
  attr_reader :deck

  def initialize
    @deck = SUITS.product(VALUES).shuffle
  end

  def to_s
    @deck
  end
end

class Cards < Deck
  def 
end

class Game
  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def deal_cards

  end

  def show_initial_cards
  end

  def player_turn
  end

  def dealer_turn
  end

  def winner?
  end

  def display_results
  end

  def play_again?
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    dealer_trun
    show_result
  end

end

Game.new.start