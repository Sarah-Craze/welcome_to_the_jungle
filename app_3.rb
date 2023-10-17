require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|         🦁'WELCOME TO THE JUNGLE'! 🐆         |"
puts "|  🌿🗡️ The last survivor wins the game ! 🗡️ 🌿   |"
puts "-------------------------------------------------"

# Crée une instance de Game
my_game = Game.new("Wolverine")

# Le combat
while my_game.is_still_ongoing?
  my_game.show_players
  my_game.menu
  print "> "
  choice = gets.chomp
  my_game.menu_choice(choice)
  my_game.enemies_attack
end

# Fin du jeu
my_game.show_end