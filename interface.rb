class Interface
  def start_game
    puts "Привет дорогой гость. Пожалуйста введите имя чтобы играть!"
    user_name = gets.chomp
    @user = User.new(user_name)
    @user.initial_add_cards(@user)
    @dealer = Dealer.new
    @dealer.initial_add_cards(@dealer)
    user_action
  end

  def user_action
    # Действие пользователя
    puts "Привет, #{user.name}!\n
          Введите 1, чтобы пропустить ход.\n
          Введите 2, чтобы добавить карту.\n
          Введите 3, чтобы открыть карты.\n 
          Введите 4, чтобы выйти."
    choice = gets.chomp.to_i
    case choice
    when 1 then dealer_action
    when 2 then add_card_on_hands(user)
    when 3 then open_cards 
    when 4 then exit
  end

  def dealer_action
    # Действие дилера
    @dealer.total_points < 17 ? add_card_on_hands(@dealer) : user_action
  end

  private

  def add_card_on_hands(gamer)
    gamer.add_card(playing_card)
  end

  def open_cards
    @user.open_cards
    @dealer.open_cards
  end

  def initial_add_cards(gamer)
    2.times { gamer.add_card(playing_card) }
  end
end
