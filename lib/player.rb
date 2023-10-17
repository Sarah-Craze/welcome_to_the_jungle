class Player 
    attr_accessor :name, :life_points

def initialize(name)
    @name = name
    @life_points = 10
end

def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
        @life_points = 0
      puts "Le joueur #{@name} a été tué ! Gameover. ☠"
    else
        show_state
    end
end

  def attacks(player)
    puts "#{@name} attaque #{player.name}.⚔️"
    damage = compute_damage
    player.gets_damage(damage)
    puts "Il lui inflige #{damage} points de dommages.🤕"
end

def compute_damage
    return rand(1..6)
  end

  def is_alive?
    @life_points > 0
  end
end

class HumanPlayer < Player
    attr_accessor :weapon_level
  
    def initialize(name)
      super(name)
      @life_points = 100
      @weapon_level = 1
    end
  
    def show_state
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
    end
  
    def compute_damage
      rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
    
        if new_weapon_level > @weapon_level
          @weapon_level = new_weapon_level
          puts "Super ! Elle est meilleure que ton arme actuelle : tu la prends."
        else
          puts "Humm... Elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        dice_result = rand(1..6)
    
        case dice_result
        when 1
          "Tu n'as rien trouvé..."
        when 2..5
          @life_points += 50
          @life_points = [@life_points, 100].min  # Limite la vie à 100 points
          "Bravo, tu as trouvé un pack de +50 points de vie ! ❤️‍🩹"
        when 6
          @life_points += 80
          @life_points = [@life_points, 100].min  # Limite la vie à 100 points
          "Waow, tu as trouvé un pack de +80 points de vie ! 😃 🎒"
        end
    end
   
  
  end
  