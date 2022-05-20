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


  def deserialise
    #
  end


  def save
    serialise(@game)
    File.write(get_next_filename, @serialised)
  end


  def get_next_filename
    id = 1

    while File.exist?(@@PATH + id.to_s + '.yml')
      id += 1
    end

    @@PATH + id.to_s + '.yml'
  end


  def load
    #
  end
  

end