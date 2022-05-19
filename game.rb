
class Game

  @word
  @guesses
  @@DICT_FILE = 'google-10000-english-no-swears.txt'
  


  def initialize
    @word = get_secret_word
    @guesses = []
    @MAX_GUESSES = 12
  end


  def play
    intro
    until win? or hanged?

      unless @guesses.length == 0
        return 'save' if save?
      end

      until validate(get_letter)
        puts 'Invalid input.'
        guess = get_letter
      end
      @guesses << guess
      #check letter
      #score
      #draw hangman
      #check end game
      
    end
  end


  private

  def intro
    puts 'Guess the secret word before you hang!'
    puts "You have #{@MAX_GUESSES} guesses."
  end


  def get_secret_word
    dictionary = IO.readlines(@@DICT_FILE)
    words = dictionary.select { |word| word.strip!.length.between?(5, 12) }
    words.sample
  end


  def get_letter
    puts "\nEnter a letter [a-z]: "
    gets.chomp
  end


  def validate(letter)
    letter.match?(/[[:alpha:]]/)
  end


  def win?
    false
  end


  def hanged?
    false
  end


  def save?
    puts 'Save game? y/n'
    ['y', 'Y'].include?(gets.chomp)
  end

end