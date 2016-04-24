# * In your `Game` class, set the marks of the players you are passed. Include
#   the following methods:
#   - `current_player`
#   - `switch_players!`
#   - `play_turn`, which handles the logic for a single turn
#   - `play`, which calls `play_turn` each time through a loop until the game is
#     over

require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :moves

  def initialize(player1, player2)
    @board = Board.new
    @current_player = player1
    @players = [player1, player2]
    @moves = 0
    player1.mark = :X
    player2.mark = :O
  end

  def play_turn
    puts @current_player.name
    begin
      @board.place_mark(@current_player.get_move, @current_player.mark)
    rescue
      puts "Invalid Move. Try again #{@current_player.name}"
      @board.place_mark(@current_player.get_move, @current_player.mark)
    end
    @moves += 1
    switch_players!
  end

  def current_player
    @current_player
  end

  def switch_players!
    @current_player = (@players[0] == @current_player) ? @players[1] : @players[0]
  end

  def play
    puts "Welcome to Tic-Tac-Toe!"

    begin
      @current_player.display(board)
      play_turn
    end until @board.over?

    @current_player.display(board)
    puts "You won in #{@moves} moves!"
  end

end

g = Game.new(HumanPlayer.new("Rocko"), ComputerPlayer.new("R2-D2")).play
