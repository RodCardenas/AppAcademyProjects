# * In your `Board` class, you should have a grid instance variable to keep track
#   of the board tiles. You should also have the following methods:
#   - `place_mark`, which takes a position such as `[0, 0]` and a mark such as :X
#     as arguments. It should throw an error if the position isn't empty.
#   - `empty?`, which takes a position as an argument
#   - `winner`, which should return a mark
#   - `over?`, which should return true or false
#   - If you want to be a little fancy, read the attached `bracket-methods`
#     reading.

class Board
  attr_accessor :grid

  def initialize(grid = nil)
    if grid.nil?
      @grid = [
        [nil, nil, nil],
        [nil, nil, nil],
        [nil, nil, nil],
      ]
    else
      @grid = grid
    end
  end

  def place_mark(position, mark)
    if empty?(position)
      @grid[position[0]][position[1]] = mark
    else
      raise "INVALID MOVE. Space is not empty. #{position}"
    end
  end

  def empty?(position)
    @grid[position[0]][position[1]].nil?
  end

  def winner
    @grid.each do |row|
      if row[0] == row[1] && row[0] == row[2]
        return row[0] unless row[0].nil?
      end
    end

    #columns
    i = 0
    while i < 3
      if @grid[0][i] == @grid[1][i] && @grid[0][i] == @grid[2][i]
        return @grid[0][i] unless empty?([0,i])
      end
      i += 1
    end

    #diagonals
    if (@grid[0][0] == @grid[1][1] && @grid[0][0] == @grid[2][2]) ||
      (@grid[2][0] == @grid[1][1] && @grid[0][2] == @grid[2][0])
      return @grid[1][1] unless empty?([1,1])
    end

    nil
  end

  def over?
    if winner then return true end

    @grid.each do |row|
      if row[0].nil? || row[1].nil? || row[2].nil?
        return false
      end
    end

  end

end
