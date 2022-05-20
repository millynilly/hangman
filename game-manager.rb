require 'yaml'

class GameManager

  @game
  @path
  @serialised
  @@PATH = File.join('saved-games', 'game')


  def initialize(game = nil)
    @game = game
  end


  def serialise(game)
    @serialised = YAML.dump(game)
  end


  def deserialise(filename)
    @game = YAML.load(File.read(filename))
    puts @game.class
  end


  def save
    serialise(@game)

    id = get_next_id
    File.write(@@PATH + id + '.yml', @serialised)

    puts "Game saved in game#{id}.yml\n\n"
  end


  def get_next_id
    id = 1

    while File.exist?(@@PATH + id.to_s + '.yml')
      id += 1
    end

    id.to_s
  end


  def load
    filename = choose_game
    puts filename
    deserialise(filename)
    @game
  end


  def choose_game
    puts 'Choose a game: '
    Dir.glob('saved-games/*') do |file|
      print file[12, 5] + '   '
    end
    puts "\n"

    game = gets.chomp
    until File.exist?('saved-games/' + game + '.yml')
      print 'Invalid filename. Try again: '
      game = gets.chomp
    end
    'saved-games/' + game + '.yml'
  end
  

end