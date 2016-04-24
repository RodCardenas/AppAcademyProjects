# * In your player classes, have an instance variable `mark` that the game will
#   set on initialize.
#
# * In your `ComputerPlayer` class,
#   - `display` should store the board it's passed as an instance variable, so
#     that `get_move` has access to it
#   - `get_move` should return a winning move if one is available, and otherwise
#     move randomly.

class ComputerPlayer
  attr_accessor :mark, :name, :board

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
    puts ""
    puts " #{board.grid[0][0] || " "}| #{board.grid[0][1] || " "}| #{board.grid[0][2] || " "}"
    puts "--------"
    puts " #{board.grid[1][0] || " "}| #{board.grid[1][1] || " "}| #{board.grid[1][2] || " "}"
    puts "--------"
    puts " #{board.grid[2][0] || " "}| #{board.grid[2][1] || " "}| #{board.grid[2][2] || " "}"
    puts ""
  end

  def get_move
    grid = @board.grid

    #@rows
    grid.each_with_index do |row, idx|
      if winning_move_r?(0, 1, idx) && @board.empty?([idx, 2])
        return [idx, 2]
      elsif winning_move_r?(1, 2, idx) && @board.empty?([idx, 0])
        return [idx, 0]
      elsif winning_move_r?(0, 2, idx) && @board.empty?([idx, 1])
        return [idx, 1]
      end
    end

    #columns
    idx = 0
    while idx < 3
      if winning_move_c?(0, 1, idx) && @board.empty?([2, idx])
        return [2, idx]
      elsif winning_move_c?(1, 2, idx) && @board.empty?([0, idx])
        return [0, idx]
      elsif winning_move_c?(0, 2, idx) && @board.empty?([1, idx])
        return [1, idx]
      end
      idx += 1
    end

    #diagonals
    if winning_move_d?(0, 1) && @board.empty?([2, 2])
      return [2, 2]
    elsif winning_move_d?(2, 1) && @board.empty?([0, 0])
      return [0, 0]
    elsif winning_move_d?(2, 0) && @board.empty?([1, 1])
      return [1, 1]

    elsif grid[2][0] == grid[1][1] && !@board.empty?([2, 0]) && @board.empty?([0, 2])
      return [0, 2]
    elsif grid[0][2] == grid[1][1] && !@board.empty?([1, 1]) && @board.empty?([2, 0])
      return [2, 0]
    elsif grid[0][2] == grid[2][0] && !@board.empty?([0, 2]) && @board.empty?([1, 1])
      return [1, 1]
    end

    #random
    r = nil
    c = nil
    rndm = Random.new

    begin
      r = rndm.rand(3)
      c = rndm.rand(3)
    end until @board.empty?([r, c])

    return [r,c]
  end

  def winning_move_c?(row1, row2, col)
    grid = @board.grid
    (grid[row1][col] == grid[row2][col]) && !@board.empty?([row1, col])
  end

  def winning_move_r?(col1, col2, row)
    grid = @board.grid
    (grid[row][col1] == grid[row][col2]) && !@board.empty?([row, col1])
  end

  def winning_move_d?(pos1, pos2)
    grid = @board.grid
    (grid[pos1][pos1] == grid[pos2][pos2]) && !@board.empty?([pos1, pos1])
  end
end
