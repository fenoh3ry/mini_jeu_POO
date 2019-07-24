require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def home
  puts "*********************************************************************"
  puts "*                                                                   *" 
  puts "*  |   T'es maintenant sur mon jeu 'ILS VEULENT TOUS MA POO' !   |  *"
  puts "*  |                                                             |  *" 
  puts "*  |                                                             |  *" 
  puts "*  |                                                             |  *" 
  puts "*  |      Le but du jeu est d'être le dernier survivant !        |  *"
  puts "*                                                                   *"  
  puts "*-------------------------------------------------------------------*"

end

def init_player
  print "Bienvenue dans le jeu; Tu t'appel comment? "
  player_name = gets.chomp
  puts "Bonjour #{player_name} !"
  player_man = HumanPlayer.new(player_name)
  puts "J'ai créé ton avatar !"
  return player_man
end

home
human_being = init_player

# Creation de joueurs enemie
enemie1 = Player.new("Josiane")
enemie2 = Player.new("José")
enemies = [enemie1,enemie2]

while human_being.life_points>0 && (enemie1.life_points > 0 || enemie2.life_points >0)
  #ici c'est le statut de joueur humain
  human_being.show_state

  # selection d'action
  puts "**********************************"
  puts "Quelle action veux-tu effectuer ? "
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts
  puts "attaquer un joueur en vue :"
  if enemie1.life_points > 0
    print "0 - "
    enemie1.show_state
  end
  if enemie2.life_points > 0
    print "1 - "
    enemie2.show_state
  end
  puts
  puts "Votre choix ?"
  action = gets.chomp
  puts "----------------------------------"

  # decisions regarding the actions selected
  if action == "a"
    human_being.search_weapon
  end
  if action == "s"
    human_being.search_health_pack
  end
  if action == "0" && enemie1.life_points > 0
    human_being.attacks(enemie1)
  end
  if action == "1" && enemie2.life_points > 0
    human_being.attacks(enemie2)
  end

  puts "----------------------------------"

  # riposte of our enemies
  if enemie2.life_points>0 && enemie1.life_points> 0
     puts "Les autres joueurs t'attaquent !"
  end
  enemies.each do | enemie |
    if enemie.life_points>0
      enemie.attacks(human_being)
    end
  end

end

# end of the game - losing or winning 
puts "**********************************"
puts "*** La partie est finie ***"
if human_being.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end
puts "**********************************"