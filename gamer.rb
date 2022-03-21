# frozen_string_literal: true

class Gamer
  attr_accessor :bank
  attr_reader :total_points, :name, :playing_cards

  def initialize(user_name = 'Dealer')
    @name = user_name
    @bank = 100
    @playing_cards = []
    @total_points = 0
  end

  def add_card(playing_card)
    @playing_cards.push(playing_card)
    if playing_card[0].include? 'T'
      choice = @total_points <= 10 ? 1 : 0
      @total_points += playing_card.dig(1, choice)
    else
      @total_points += playing_card[1].to_i
    end
  end

  def show_playing_cards
    @playing_cards.each { |playing_card| playing_card[0] }
  end
end
