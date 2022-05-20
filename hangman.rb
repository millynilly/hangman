require_relative 'game.rb'
require_relative 'game-manager.rb'


def intro
  puts "\n"
  puts 'Hangman'
  puts '-------'
  print 'Load saved game? y/n: '
end


intro
game = ['y', 'Y'].include?(gets.chomp) ?
  GameManager.new.load :
  Game.new

if game.play == 'save'
  GameManager.new(game).save
end



  
