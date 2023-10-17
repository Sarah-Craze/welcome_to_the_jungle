require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


# À ma droite "Josiane"
player1 = Player.new("José")

# À ma gauche "José"
player2 = Player.new("Josiane")

# Présentons les deux combattants
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
puts "*-----------------------------------*"
# Fight !
puts "Passons à la phase d'attaque :"
# Boucle de combat
while player1.life_points > 0 && player2.life_points > 0
  # Josiane attaque José
  player1.attacks(player2)

  # Vérifie si José est mort
  break if player2.life_points <= 0

  # José contre-attaque
  player2.attacks(player1)
  puts "*-----------------------------------*"

  # Affiche l'état après chaque tour
  puts "Voici l'état de chaque joueur :" 
  player1.show_state
  player2.show_state

  # Vérifie si Josiane est morte
  break if player1.life_points <= 0
end
