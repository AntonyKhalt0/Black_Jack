class Gamer
  attr_accessor :bank
  attr_reader :total_points

  def initialize
    @bank = 100
    @playing_cards = []
    @total_points = 0
  end

  def add_card(playing_card)
    @playing_cards.push(playing_card)
    @total_points += playing_card.values[0]
  end
   
  def show_playing_cards
    @playing_cards.each { |playing_card| playing_card[0] }
  end
end
