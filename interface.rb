class Interface
  def initialize
    @bank = 0
  end

  def start_game(user_name = nil)
    @user ||= User.new(user_name)
    @dealer = Dealer.new
    @user.initial_add_cards(@user)
    @dealer.initial_add_cards(@dealer)
    @deck = Deck.new
    user_action
  end

  def user_action
    # Действие пользователя
    loop do
      user_action_list
      choice = gets.chomp.to_i
      case choice
      when 1 then dealer_action
      when 2 then add_card_on_hands(user)
      when 3 then open_cards 
      when 4 then game_exit
      end
    end
  end

  def dealer_action
    # Действие дилера
    puts "Ход дилера! Ожидайте"
    10.times do 
      print "#{['/','|','\|'].rand}"
      sleep 1
    end
    @dealer.total_points < 17 ? add_card_on_hands(@dealer) : user_action
  end

  private

  def add_card_on_hands(gamer)
    gamer.add_card(playing_card)
  end

  def open_cards
    puts "Карты игрока: #{@user.show_playing_cards}\n
          Сумма очков игрока: #{@user.total_points}\n
          Карты дилера: #{@dealer.show_playing_cards}\n
          Сумма очков игрока: #{@dealer.total_points}"
    if @user.total_points <= 21 && @user.total_points > @dealer.total_points
      puts "Вы выиграли! Хотите сыграть снова?"
    else
    end
  end

  def initial_add_cards(gamer)
    2.times { gamer.add_card(playing_card) }
  end

  def playing_card
    playing_card = @deck.deck_shufle[0]
    @deck.to_a.delete(playing_card)
  end

  def user_action_list
    puts "Привет, #{@user.name}!\n
          Введите 1, чтобы пропустить ход.\n
          Введите 2, чтобы добавить карту.\n
          Введите 3, чтобы открыть карты.\n 
          Введите 4, чтобы выйти."
  end

  def game_result
  end

  def game_exit
    puts "До свидания! Приходите снова!"
    exit
  end
end
