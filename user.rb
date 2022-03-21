require_relative 'gamer'

class User < Gamer
  attr_accessor :bank
  attr_reader :name, :total_points

  # Инициализация с именем
  def initialize(name)
    super
    @name = name
  end
end
