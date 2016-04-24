# * In your player classes, have an instance variable `mark` that the game will
#   set on initialize.
#
# * In your `HumanPlayer` class,
#   - `display` should print the board out to the console
#   - `get_move` should allow the player to enter a move of the form '0, 0', and
#     return it as a position of the form `[0, 0]`

class HumanPlayer
  attr_accessor :mark, :name

  def initialize(name)
    @name = name
  end

  def display(board)
    puts ""
    puts " #{board.grid[0][0] || " "}| #{board.grid[0][1] || " "}| #{board.grid[0][2] || " "}"
    puts "--------"
    puts " #{board.grid[1][0] || " "}| #{board.grid[1][1] || " "}| #{board.grid[1][2] || " "}"
    puts "--------"
    puts " #{board.grid[2][0] || " "}| #{board.grid[2][1] || " "}| #{board.grid[2][2] || " "}"
    puts ""
  end

  def get_move
    puts "Please enter move in the form 'x, y' where x is the row and y is the column indicating the postion where the mark will be placed:"
    move = gets.chomp

    [move[0].to_i, move[-1].to_i]
  end
end
