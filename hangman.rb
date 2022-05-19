require_relative 'game.rb'
require_relative 'game-manager.rb'


def intro
  puts "\n"
  puts 'Hangman'
  puts '-------'
  puts 'Load saved game? y/n'
end


def display(outcome)
  case outcome
  when 'save'
    puts outcome
  when 'win'
    puts outcome
  else
    puts outcome
  end
end


intro
game = ['y', 'Y'].include?(gets.chomp) ?
  GameManager.new.retrieve_game :
  Game.new

outcome = game.play
display(outcome)



  
