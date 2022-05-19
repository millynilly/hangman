
class Game

  @word
  @guesses
  @DICT_FILE = 'google-10000-english-no-swears.txt'


  def initialize
    @word = get_secret_word
    @guesses = []
  end


  def play
    #intro
    #until win or hanged or save
      #unless first guess save game?
        #return save
      #else
        #get letter
        #check letter
        #score
        #draw hangman
        #check end game
    #end
  end


  private

  def get_secret_word
    dictionary = IO.readlines(@DICT_FILE)
    words = dictionary.select { |word| word.strip!.length.between?(5, 12) }
    words.sample
  end

end