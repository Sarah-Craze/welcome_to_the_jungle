class Game
    attr_accessor :human_player, :enemies
  
    def initialize(player_name)
      @human_player = HumanPlayer.new(player_name)
      @enemies = Array.new(4) { |i| Player.new("Player#{i + 1}") }
    end
  
    def kill_player(player)
      @enemies.delete(player)
    end
  
    def is_still_ongoing?
      @human_player.is_alive? && !@enemies.empty?
    end
  
    def show_players
      puts @human_player.show_state
      puts "Il reste #{@enemies.length} joueur(s) en vie."
    end
  
    def menu
      puts "\nQuelle action veux-tu effectuer ?"
      puts "a - Chercher une meilleure arme"
      puts "s - Chercher à se soigner"
      puts "\nAttaquer un joueur en vue :"
      @enemies.each_with_index do |enemy, index|
        puts "#{index} - #{enemy.show_state}" if enemy.is_alive?
      end
    end
  
    def menu_choice(choice)
      case choice
      when 'a'
        @human_player.search_weapon
      when 's'
        @human_player.search_health_pack
      else
        attack_index = choice.to_i
        if attack_index.between?(0, @enemies.length - 1) && @enemies[attack_index].is_alive?
          @human_player.attacks(@enemies[attack_index])
          kill_player(@enemies[attack_index]) unless @enemies[attack_index].is_alive?
        else
          puts "Choix invalide. Réessaye."
        end
      end
    end
  
    def enemies_attack
      @enemies.each { |enemy| enemy.attacks(@human_player) if enemy.is_alive? }
    end
  
    def show_end
      puts "\nLa partie est finie."
      if @human_player.is_alive?
        puts "BRAVO ! TU AS GAGNÉ !"
      else
        puts "Loser ! Tu as perdu !"
      end
    end
  end