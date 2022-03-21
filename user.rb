class User
  attr_accessor :bank
  attr_reader :name, :total_points

  # Инициализация с именем
  def initialize(name)
    @name = name
    @bank = 100
    @playing_cards = []
    @total_points = 0
  end

  # Действие Добавить карту
  def add_card(playing_card)
    @playing_cards.push(playing_card)
    @total_points += playing_card.values[0]
  end

  # Действие Открыть карты 
  def show_playing_cards
    @playing_cards.each { |playing_card| playing_card[0] }
  end
end
