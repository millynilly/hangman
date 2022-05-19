require_relative 'game.rb'
#require_relative 'file-manager.rb'

def intro
  puts "\n"
  puts 'Hangman'
  puts '-------'
  puts 'Load saved game?'
end

intro
# game = ['y', 'Y'].include?(gets.chomp) ?
#   FileManager.new.retrieve_game :
#   Game.new

# game.play

  
