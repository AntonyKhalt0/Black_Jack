# frozen_string_literal: true

require_relative 'game_result'

class Interface
  include GameResult

  def initialize
    @bank = 0
  end

  def start_game
    create_user
    @dealer = Dealer.new
    @deck = DeckCards.new
    initial_add_cards(@user)
    initial_add_cards(@dealer)
    @bank += 20
    @user.bank -= 10
    @dealer.bank -= 10
    user_action
  end

  private

  def user_action
    loop do
      user_action_list
      action_menu
      game_table
      open_cards if @user.playing_cards.length == 3 && @dealer.playing_cards.length == 3
    end
  end

  def dealer_action
    game_table
    puts 'Ход дилера! Ожидайте'
    10.times do
      print ['/', '|', '\|'].sample
      sleep 1
    end
    @dealer.total_points < 17 ? add_card_on_hands(@dealer) : user_action
  end

  def add_card_on_hands(gamer)
    gamer.playing_cards.length != 3 ? gamer.add_card(playing_card) : puts('Куда еще?)')
    game_table
  end

  def open_cards
    game_table
    puts "Карты игрока: #{@user.show_playing_cards}\n
          Сумма очков игрока: #{@user.total_points}\n
          Карты дилера: #{@dealer.show_playing_cards}\n
          Сумма очков дилера: #{@dealer.total_points}"
    game_result
  end

  def initial_add_cards(gamer)
    gamer.add_card(playing_card)
    gamer.add_card(playing_card)
  end

  def playing_card
    playing_card = @deck.deck_shuffle
    @deck.delete_card(playing_card)
    playing_card
  end

  def user_action_list
    game_table
    puts "Привет, #{@user.name}!\n \
          Введите 1, чтобы пропустить ход.\n \
          Введите 2, чтобы добавить карту.\n \
          Введите 3, чтобы открыть карты.\n \
          Введите 4, чтобы выйти."
  end

  def action_menu
    choice = gets.chomp.to_i
    case choice
    when 1 then dealer_action
    when 2 then add_card_on_hands(@user)
    when 3 then open_cards
    when 4 then game_exit
    end
  end

  def game_exit
    puts 'До свидания! Приходите снова!'
    exit
  end

  def replay_game
    new_bank
    puts 'Хотите сыграть снова? (y/n)'
    choice = gets.chomp
    choice == 'y' ? start_game : game_exit
  end

  def new_bank
    @bank = 0
  end

  def game_table
    puts "| Банк: #{@bank} |\n| Карты дилера: ******\n \
          | Ваши карты: #{@user.show_playing_cards}"
  end

  def create_user
    puts 'Привет дорогой гость. Пожалуйста, введите имя чтобы играть!'
    user_name = gets.chomp
    @user = User.new(user_name.capitalize!)
  end
end
