# frozen_string_literal: true

require_relative 'card'

class DeckCards
  BASE_DECK = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                '7' => 7, '8' => 8, '9' => 9, '10' => 10,
                'V' => 10, 'D' => 10, 'K' => 10, 'T' => [1, 11] }.freeze

  attr_reader :deck

  def initialize
    @deck = []
    creating_deck
  end

  def creating_deck
    part_deck("\u2660")
    part_deck("\u2665")
    part_deck("\u2666")
    part_deck("\u2663")
  end

  def deck_shuffle
    @deck.to_a.sample
  end

  def part_deck(unicod)
    BASE_DECK.each do |suit, value|
      card = Card.new("#{suit}#{unicod}", value)
      @deck.push(card)
    end
  end

  def delete_card(playing_card)
    @deck.delete(playing_card)
  end
end
