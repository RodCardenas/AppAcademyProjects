class Hangman
  attr_reader :guesser, :referee, :board, :guesses, :fails

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @guesses = 0
    @fails = 6
    @consequences = ""
  end

  def setup
    word_len = @referee.pick_secret_word
    @board = Array.new(word_len)
    @guesser.register_secret_length(word_len)
  end

  def take_turn
    guess = @guesser.guess
    result = @referee.check_guess(guess)

    update_board(result, guess)
    @guesser.handle_response(guess,result)
  end

  def update_board(indeces, guess)
    indeces.each do |index|
      @board[index] = guess
    end

    if indeces.empty?
      @consequences += case 6 - @fails
                       when 0
                         "<"
                       when 1
                         "o"
                       when 2
                         "|"
                       when 3
                         "~"
                       when 4
                         "<"
                       when 5
                         " R.I.P"
                       end
      @fails -= 1
    end

    @board.each do |char|
      if char.nil?
        print "_ "
      else
        print "#{char} "
      end
    end
    puts "    #{@consequences}"

  end

  def play
    setup
    begin
      take_turn
      @guesses += 1
    end until (@board.none? { |el| el.nil? }) || @fails == 0

    puts "You guessed #{guesses} times..."
  end
end

class Player
  attr_accessor :secret_word
  def initialize(dictionary)
    @dictionary = dictionary
    @guesses_remaining = ('a'..'z').to_a
    @guesses = []
    @candidate_words = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample.chomp
    @secret_word.length
  end

  def check_guess(lttr)
    indeces = []
    pos = 0

    result = @secret_word.index(lttr, pos)

    if result.nil?

      return indeces
    end

    begin
      indeces << result
      pos = result
      result = @secret_word.index(lttr, pos + 1)
    end until result.nil?

    indeces
  end

  def register_secret_length(len)
    @length = len
  end

  def handle_response(guess, indeces)
    @guesses_remaining.delete(guess)
    @guesses << guess
    if indeces.empty?
      @candidate_words = @candidate_words.select { |word| !word.include?(guess) }
    else
      @candidate_words = @candidate_words.select { |word| word_has_guess_at_indeces_and_nowhere_else?(word,indeces,guess) }
    end

  end

  def candidate_words
    @candidate_words.select do |word|
      word.length == @length && word.chars.any? do |ltr|
        @guesses_remaining.include?(ltr)
      end
    end
  end

  def word_has_guess_at_indeces_and_nowhere_else?(word,indeces,guess)
    results = []

    indeces.each do |idx|
      results << (word.index(guess, idx) == idx)
    end

    (results.all? { |res| res }) && ( word.chars.count { |ch| ch == guess } == indeces.size )
  end
end

class HumanPlayer < Player
  def guess
    puts "Guess a character [a-z]:"
    guess = $stdin.gets.chomp
    raise "Only one character at a time is allowed." if guess.length > 1
    guess
  end
end

class ComputerPlayer < Player
  def guess(board)
    letters = Hash.new(0)
    @candidate_words.each do |word|
      word.chars.each do |ch|
        letters[ch] += 1
      end
    end

    board.each do |letter|
      letters.delete(letter)
    end

    most_common_lttr = letters.max_by{ |char,count| count }
    most_common_lttr[0]
  end
end
