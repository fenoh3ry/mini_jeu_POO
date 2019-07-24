class Game
 attr_accessor :humanplayer, :ennemies
# Define enemies and the playable character of the USer
 def initialize (humanplayer)
   @humanplayer = HumanPlayer.new("#{humanplayer}")
   @player_1 = Player.new("Josiane")
   @player_2 = Player.new("José")
   @player_3 = Player.new("Riana")
   @player_4 = Player.new("Jean")
   @players_left = 10
   @enemies_in_sight = []
   @ennemies = [@player_1, @player_2, @player_3, @player_4]
 end
 def kill_player
   @ennemies.each {
    |player|
   if (player.life_points <= 0)
     @ennemies.delete(player)
     puts "#{player.name} est mort"
   end
   }
 end
 def is_still_ongoing?
   if @humanplayer.life_points > 0 && (@player_1.life_points > 0 || @player_2.life_points > 0 || @player_3.life_points > 0 || @player_4.life_points > 0)
     return true
   else
     return false
   end
 end
# Displays User status (HP + weapon lvl) + amount of remaining enemies on field
 def show_players
   puts
   @humanplayer.show_state
   puts "2) #{@ennemies.size} les ennemis sont en train de se battre"
   puts
 end
# Seléction menu
 def menu
   command = 1
   puts "Qu'est que tu veux faire ?"
   puts "a - Chercher une meilleure arme"
   puts "s - Se soigner"
   puts
   puts "Attaquer un autre joueur :"
   @ennemies.each {
   |player| puts "#{command} - #{player.name} a #{player.life_points} vie"
   command += 1
    }
 end
# Choix
 def menu_choice(action)
   if action == "a"
     @humanplayer.search_weapon
       elsif action == "s"
     @humanplayer.search_health_pack
       elsif action == "1"
     @humanplayer.attacks(@player_1)
       elsif action == "2"
     @humanplayer.attacks(@player_2)
       elsif action == "3"
     @humanplayer.attacks(@player_3)
       elsif action == "4"
     @humanplayer.attacks(@player_4)
       else puts "Sélectionner une option a, s, 1, 2, 3 or 4"
   end
     kill_player
 end
 def enemies_attack
   puts "Les autres joueurs attaquent !"
     @ennemies.each {
     |player| player.attacks(@humanplayer)
       }
 end
# Game over screen
end