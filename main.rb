require_relative 'user'
require_relative 'dealer'
require_relative 'interface'
require_relative 'deck_cards'

new_game = Interface.new
puts "Привет дорогой гость. Пожалуйста, введите имя чтобы играть!"
user_name = gets.chomp
new_game.start_game(user_name)
