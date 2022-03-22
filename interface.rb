# frozen_string_literal: true

require_relative 'game'

class Interface
  def initialize(game)
    @game = game
    create_user
    @game.start_game
    user_action_menu
  end

  def user_action_menu
    loop do
      open_cards if @game.auto_open_cards
      user_action
    end
  end

  def user_action
    game_table
    puts "\nПривет, #{@game.user.name}!\n \
          Введите 1, чтобы пропустить ход.\n \
          Введите 2, чтобы добавить карту.\n \
          Введите 3, чтобы открыть карты.\n \
          Введите 4, чтобы выйти."
    action_menu
  end

  def action_menu
    choice = gets.chomp.to_i
    case choice
    when 1 then dealer_action
    when 2 then add_card_on_hands(@game.user)
    when 3 then open_cards
    when 4 then game_exit
    end
  end

  def dealer_action
    game_table
    puts 'Ход дилера! Ожидайте'
    10.times do
      print ['/', '|', '\|'].sample
      sleep 1
    end
    @game.dealer_action || user_action_menu
  end

  def add_card_on_hands(gamer)
    @game.add_card_on_hands(gamer) || puts('Куда еще?)')
    game_table
  end

  def open_cards
    game_table
    open_cards = @game.open_cards
    puts "          Карты игрока: #{open_cards[0]}
          Сумма очков игрока: #{open_cards[1]}
          Карты дилера: #{open_cards[2]}
          Сумма очков дилера: #{open_cards[3]}"
    @game.game_result
    replay_game
  end

  def game_exit
    puts 'До свидания! Приходите снова!'
    @game.game_exit
  end

  def replay_game
    puts 'Хотите сыграть снова? (y/n)'
    @game.replay_game
  end

  def create_user
    puts 'Привет дорогой гость. Пожалуйста, введите имя чтобы играть!'
    @game.create_user if @game.user.nil?
  end

  def game_table
    @game.game_table
    puts "| Банк: #{@game.data_table[0]} |\n| Карты дилера: ******
          | Ваши карты: #{@game.data_table[1]}
          | Ваши очки: #{@game.data_table[2]}"
  end
end
