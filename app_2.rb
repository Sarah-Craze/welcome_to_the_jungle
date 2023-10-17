require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts"-------------------------------------------------"
puts"|         🦁'WELCOME TO THE JUNGLE'! 🐆         |"
puts"|  🌿🗡️ The last survivor wins the game ! 🗡️ 🌿   |"
puts"-------------------------------------------------"

# app_2.rb

require 'bundler'
Bundler.require

player1 = Player.new("José")
player2 = Player.new("Josiane")

# Initialisation du joueur
puts "Quel est ton prénom ? 🙃"
print "> "
player_name = gets.chomp
human_player = HumanPlayer.new(player_name)

# Initialisation des ennemis
enemies = [Player.new("Josiane"), Player.new("José")]

# Le combat
while human_player.is_alive? && (enemies[0].is_alive? || enemies[1].is_alive?)
  puts "\n#{human_player.show_state}"
  puts "\nQuelle action veux-tu effectuer ?"
  puts "a - Chercher une meilleure arme"
  puts "s - Chercher à se soigner"
  puts "\nAttaquer un joueur en vue :"
  puts "0 - #{enemies[0].show_state}" if enemies[0].is_alive?
  puts "1 - #{enemies[1].show_state}" if enemies[1].is_alive?
 
  print "> "
  choice = gets.chomp
  puts "*-----------------------------------*"
  case choice
  when 'a'
    human_player.search_weapon
  when 's'
    human_player.search_health_pack
  when '0'
    human_player.attacks(enemies[0]) if enemies[0].is_alive?
  when '1'
    human_player.attacks(enemies[1]) if enemies[1].is_alive?
  else
    puts "Choix invalide. Réessaye."
  end
  puts "*-----------------------------------*"
  # Les ennemis attaquent
  enemies.each do |enemy|
    enemy.attacks(human_player) if enemy.is_alive?
  end
  enemies_alive = enemies.any?(&:is_alive?)
end
puts "*-----------------------------------*"

# Fin du jeu
puts "\nLa partie est finie."
if human_player.is_alive?
  puts "BRAVO ! TU AS GAGNE ! 🏆"
else
  puts "Loser ! Tu as perdu ! 😵"
end
