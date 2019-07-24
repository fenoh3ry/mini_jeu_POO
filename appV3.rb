require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'

# Welcome screen
  puts "*********************************************************************"
  puts "                                                                     " 
  puts "   |   T'es maintenant sur mon jeu 'ILS VEULENT TOUS MA POO' !   |   "
  puts "   |                                                             |   " 
  puts "   |                                                             |   " 
  puts "   |                                                             |   " 
  puts "   |      Le but du jeu est d'être le dernier survivant !        |   "
  puts "                                                                     "  
  puts "---------------------------------------------------------------------"

# Initializing User player character
puts 'Entrer votre nom pour commencer'
puts name_player = gets.chomp
my_game = Game.new(name_player)
while my_game.is_still_ongoing? == true do
 my_game.show_players
 my_game.menu
 puts "Choisissez une option"
 action = gets.chomp.to_s
 puts
 my_game.menu_choice(action)
 my_game.enemies_attack
end