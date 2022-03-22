# frozen_string_literal: true

class Gamer
  attr_accessor :bank
  attr_reader :total_points, :name, :playing_cards

  def initialize(user_name = 'Dealer')
    @name = user_name
    @bank = 100
    clear_playing_cards
    clear_total_points
  end

  def add_card(playing_card)
    @playing_cards.push(playing_card)
    if playing_card.suit.include? 'T'
      choice = @total_points <= 10 ? 1 : 0
      @total_points += playing_card.value[choice]
    else
      @total_points += playing_card.value
    end
  end

  def clear_playing_cards
    @playing_cards = []
  end

  def clear_total_points
    @total_points = 0
  end

  def show_playing_cards
    @playing_cards.map(&:suit)
  end
end
