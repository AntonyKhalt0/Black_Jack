# frozen_string_literal: true

require_relative 'user'
require_relative 'dealer'
require_relative 'deck_cards'
require_relative 'game_result'

class Game
  include GameResult

  MAX_CARD = 3

  attr_reader :user, :deacler, :deck, :bank, :data_table

  def initialize
    @bank = 0
  end

  def start_game
    @deck = DeckCards.new
    recreate_user
    initial_add_cards(@user)
    @dealer = Dealer.new
    initial_add_cards(@dealer)
    @bank += 20
    @user.bank -= 10
    @dealer.bank -= 10
  end

  def auto_open_cards
    open_cards if @user.playing_cards.length == MAX_CARD && @dealer.playing_cards.length == MAX_CARD
  end

  def dealer_action
    @dealer.total_points < 17 if add_card_on_hands(@dealer)
  end

  def replay_game
    new_bank
    choice = gets.chomp
    choice == 'y' ? start_game : game_exit
  end

  def add_card_on_hands(gamer)
    gamer.add_card(playing_card) if gamer.playing_cards.length != MAX_CARD
    open_cards
  end

  def open_cards
    open_cards = []
    open_cards.push(@user.show_playing_cards)
    open_cards.push(@user.total_points)
    open_cards.push(@dealer.show_playing_cards)
    open_cards.push(@dealer.total_points)
  end

  def game_table
    @data_table = []
    @data_table.push(@bank)
    @data_table.push(@user.show_playing_cards)
    @data_table.push(@user.total_points)
  end

  def new_bank
    @bank = 0
  end

  def create_user
    user_name = gets.chomp
    @user = User.new(user_name.capitalize!)
  end

  def game_exit
    exit
  end

  private

  def initial_add_cards(gamer)
    2.times { gamer.add_card(playing_card) }
  end

  def playing_card
    playing_card = @deck.deck_shuffle
    @deck.delete_card(playing_card)
    playing_card
  end

  def recreate_user
    @user.clear_playing_cards
    @user.clear_total_points
  end
end
