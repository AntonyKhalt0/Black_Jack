# frozen_string_literal: true

require_relative 'user'
require_relative 'dealer'
require_relative 'interface'
require_relative 'deck_cards'
require_relative 'game_result'

new_game = Interface.new
new_game.start_game
