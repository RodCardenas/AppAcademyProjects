class Code
  attr_reader :pegs

  PEGS = {}
  CODE_SIZE = 4

  def initialize(pegs)
    @pegs = pegs
  end

  def [](index)
    @pegs[index]
  end

  def []=(index, value)
    @pegs[index] = value
  end

  def exact_matches(other_code)
    matches = 0

    @pegs.each_with_index do |peg, index|
      other_peg = other_code.pegs[index]
      if (peg.upcase == other_peg) || (peg.downcase == other_peg) then matches += 1 end
    end

    matches
  end

  def near_matches(other_code)
    self_contents = {
      R: 0,
      G: 0,
      B: 0,
      Y: 0,
      O: 0,
      P: 0,
    }
    other_contents = self_contents.dup

    @pegs.each do |peg|
      self_contents[peg.upcase.to_sym] += 1
    end

    other_code.pegs.each do |other_peg|
      other_contents[other_peg.upcase.to_sym] += 1
    end

    matches = 0

    self_contents.values.each_with_index do |value, index|
      other_value = other_contents.values[index]
      matches += value <= other_value ? value : other_value
    end

    matches -= self.exact_matches(other_code)
  end

  def ==(other_code)
    return false unless other_code.instance_of?(Code)

    @pegs.each_with_index do |peg, index|
      other_peg = other_code.pegs[index]
      if (peg.upcase != other_peg) && (peg.downcase != other_peg) then return false end
    end

    true
  end

  def self.parse (str)
    condition = str.scan(/[rgbyopRGBYOP]/)
    if condition.size == str.length
      Code.new(str.split(""))
    else
      raise "Error. At least one wrong peg color was input."
    end
  end

  def self.random
    choices = %w[r g b y o p R G B Y O P]
    chosen = []
    randomizer = Random.new

    CODE_SIZE.times do |index|
      chosen[index] = choices[randomizer.rand(choices.size)]
    end

    Code.new(chosen)
  end

end

class Game
  attr_reader :secret_code, :guesses

  def initialize(code = nil)
    if code.nil?
      @secret_code = Code.random
    else
      @secret_code = code
    end

  end

  def get_guess
    puts "\nPlease input guess.\nValid guesses are: r for Red, g for Green, b for Blue, y for Yellow, o for Orange, and p for Purple.\nGuess should be structured: \"rgby\"."

    input = gets.chomp
    Code.parse(input)
  end

  def display_matches(code)
    puts "\nGuess##{guesses}: #{code.pegs.join("")}\nexact matches = #{@secret_code.exact_matches(code)} near matches = #{@secret_code.near_matches(code)}"
  end

  def play
    puts "Welcome to Mastermind!\n\nThe computer will select a random code of four pegs from 6 possible colors. (Duplicate colors are allowed.) You get ten turns to guess the code.\n\n"
    @guesses = 1
    begin
      guess = get_guess
      display_matches(guess)
      @guesses += 1
    end until @secret_code == guess || @guesses > 10

    if @secret_code == guess
      puts "You won!!! You guessed the code in #{guesses} turns!"
    else
      puts "I, the PC, am a true Mastermind with an unguessable code! Yield before me since you lost. By the way, the code was #{@secret_code.pegs.join("").downcase}"
    end
  end

end

g = Game.new
g.play
