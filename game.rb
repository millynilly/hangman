
class Game

  @word
  @correct
  @guesses
  @@DICT_FILE = 'google-10000-english-no-swears.txt'
  


  def initialize
    @word = get_secret_word
    puts "Word: #{@word}"
    @correct = []
    @guesses = []
    @MAX_GUESSES = 14
  end


  def play
    intro

    until end_game?

      # unless @guesses.length == 0
      #   return 'save' if save?
      # end

      guess = get_letter
      until validate(guess)
        puts 'Invalid input.'
        guess = get_letter
      end

      score(guess)
      display
      #draw hangman
    end
    'end'
  end


  private

  def intro
    puts 'Guess the secret word before you hang!'
    puts "You have #{@MAX_GUESSES} guesses."
  end


  def get_secret_word
    dictionary = IO.readlines(@@DICT_FILE)
    words = dictionary.select { |word| word.strip!.length.between?(5, 12) }
    words.sample.downcase
  end


  def get_letter
    print "\nEnter a letter [a-z]: "
    gets.chomp
  end


  def validate(letter)
    ('a'..'z').include?(letter.downcase)
    #letter.match?(/[[:alpha:]]/)
  end


  def score(letter)
    if @word.include?(letter)
      @correct << letter
      puts "\nGood guess."
    end

    @guesses << letter
  end


  def display
    reveal = []

    @word.split('').each_with_index do |letter, ind|
      reveal[ind] = @correct.include?(letter) ?
        letter :
        '_'
    end
    puts reveal.join(' ')
  end


  def end_game?
    win? || hanged?
  end


  def win?
    win = @word.split('').all? { |letter| @correct.include?(letter) }
    puts "\nWin! You guessed the word in #{@guesses.length} guesses\n\n" if win
    win
  end


  def hanged?
    hanged = @guesses.length == @MAX_GUESSES
    puts "\nHanged! You are out of guesses.\n\n" if hanged
    hanged
  end


  def save?
    print "\nSave game? y/n"
    ['y', 'Y'].include?(gets.chomp)
  end

end