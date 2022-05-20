
class Game

  @word
  @correct
  @guesses
  @@DICT_FILE = 'google-10000-english-no-swears.txt'
  @@HANGMAN = [
    '---------', '|', '|', '|', '|', '|', '-----', '   |',
    '   o', '  /', '|', "\\", '  /', " \\"
  ]
  

  def initialize
    @word = get_secret_word
    puts "Word: #{@word}"
    @correct = []
    @guesses = []
    @MAX_GUESSES = 14
    intro
  end


  def play

    until end_game?

      unless @guesses.length == 0
        return 'save' if save?
      end

      guess = get_letter
      until validate(guess)
        puts 'Invalid input.'
        guess = get_letter
      end

      score(guess)
      display
      draw_hangman(calc_hang_array)
    end
  
  end



  private

  def intro
    draw_hangman(@@HANGMAN)
    puts 'Guess the secret word before you hang!'
    puts "You have #{@MAX_GUESSES} guesses.\n\n"
  end


  def get_secret_word
    dictionary = IO.readlines(@@DICT_FILE)
    words = dictionary.select { |word| word.strip!.length.between?(5, 12) }
    words.sample.downcase
  end


  def get_letter
    print 'Enter a letter [a-z]: '
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


  def calc_hang_array
    hang = []
    guesses = @guesses.length
    remaining = @MAX_GUESSES - guesses

    guesses.times { |i| hang[i] = @@HANGMAN[i] }
    remaining.times { |i| hang[i + guesses] = '' }

    hang
  end

  
  def draw_hangman(hang)

    puts <<-HANGMAN

         #{hang[6]}
         #{hang[5]}#{hang[7]}
         #{hang[4]}#{hang[8]}
         #{hang[3]}#{hang[9]}#{hang[10]}#{hang[11]}
         #{hang[2]}#{hang[12]}#{hang[13]}
         #{hang[1]}
         #{hang[0]}

    HANGMAN
  end


  def end_game?
    win? || hanged?
  end


  def win?
    win = @word.split('').all? { |letter| @correct.include?(letter) }
    puts "\nWin! You got the word in #{@guesses.length} guesses.\n\n" if win
    win
  end


  def hanged?
    hanged = @guesses.length == @MAX_GUESSES
    puts "\nHanged! You are out of guesses.\n\n" if hanged
    hanged
  end


  def save?
    print "\nSave game? y/n: "
    ['y', 'Y'].include?(gets.chomp)
  end

end