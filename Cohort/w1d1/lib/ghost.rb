class Game
  def initialize(player1, player2, dictionary)
    @fragment = ""
    @dictionary = read_dict(dictionary)
    @players = { player1: player1, player2: player2 }
    @current_player = player1
  end

  def read_dict(dictionary)
    lines = File.readlines(dictionary)

    lines.each_with_index do |line, idx|
      lines[idx] = line.chomp
    end

    lines
  end


  def play_round
    until lost?
      take_turn(@current_player)
      next_player!
    end

    puts "#{@previous_player.name} you lost! #{@fragment} is a word!!!"
  end

  def lost?
    @dictionary.include?(@fragment)
  end

  def current_player
    @current_player
  end

  def previous_player
    @previous_player
  end

  def next_player!
    if @current_player == @players[:player1]
      @current_player = @players[:player2]
      @previous_player = @players[:player1]
    else
      @current_player = @players[:player1]
      @previous_player = @players[:player2]
    end
  end

  #: gets a string from the player until a valid play is made; then updates the fragment and checks against the dictionary. You may also want to alert the player if they attempt to make an invalid move (or, if you're feeling mean, you might cause them to lose outright).
  def take_turn(player)
    begin
      new_guess = player.guess
    end until valid_play?(new_guess)
    @fragment += new_guess
  end

    #Checks that string is a letter of the alphabet and that there are words we can spell after adding it to the fragment
  def valid_play?(string)
    new_fragment = @fragment + string
    @dictionary.any? { |word| word.start_with?(new_fragment) }
  end

  class Player
    attr_accessor :name
    def initialize(name)
      @name = name
    end

    def guess
      puts "#{self.name}, Please enter your guess:"

      begin
        guess = gets.chomp.downcase
      end until !alert_invalid_guess(guess)
      guess
    end

    def alert_invalid_guess(guess)
       if guess.length > 1 || !('a'..'z').to_a.include?(guess)
         puts "Invalid guess, please try again."
         return true
       end
       false
    end

  end
end

p1 = Game::Player.new("Beck")
p2 = Game::Player.new("Rod")
p p1
p p2
g = Game.new(p1, p2, "lib/dictionary.txt")
p g.current_player
g.play_round
