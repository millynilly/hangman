require_relative 'game.rb'
require_relative 'game-manager.rb'


def intro
  puts "\n"
  puts 'Hangman'
  puts '-------'
  puts 'Load saved game? y/n'
end


intro
game = ['y', 'Y'].include?(gets.chomp) ?
  GameManager.new.retrieve_game :
  Game.new

game.play



  
