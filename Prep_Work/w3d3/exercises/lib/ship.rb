# - Update your game to use different types of ships, each of a different
#   size. Here are the canonical ship sizes (though of course you could
#   choose your own):
#
# The available ships are:
# | Ship type   | Dim |
# | ----------- | --- |
# | Carrier     | 5x1 | type = 4
# | Battleship  | 4x1 | type = 3
# | Submarine   | 3x1 | type = 2
# | Patrol      | 2x1 | type = 1
# | Raft        | 1x1 | type = 0"

class Ship
  attr_accessor :type, :start_pos, :end_pos, :size, :positions

  SHIPS = [
    "Raft",
    "Patrol",
    "Submarine",
    "Battleship",
    "Carrier"
  ]

  def initialize(type, start_pos, end_pos)
    @type = SHIPS[type]
    @size = type + 1
    @start_pos = start_pos
    @end_pos = end_pos
    @positions = {}

    row_dif = end_pos[0] - start_pos[0]
    col_dif = end_pos[1] - start_pos[1]
    col = start_pos[1]
    row = start_pos[0]

    if row_dif > 0 #vertical
      @size.times do |dif|
        @positions.store([(row + dif), col], :s)
      end
    elsif row_dif < 0 #vertical
      @size.times do |dif|
        @positions.store([(row - dif), col], :s)
      end
    elsif col_dif > 0 #vertical#horizontal
      @size.times do |dif|
        @positions.store([row, (col + dif)], :s)
      end
    elsif col_dif < 0 #vertical#horizontal
      @size.times do |dif|
        @positions.store([row, (col - dif)], :s)
      end
    elsif row_dif == 0 && col_dif == 0
      @positions.store(start_pos, :s)
    end

    # puts @positions
  end

  def alive?
    @positions.each do |pos, state|
      return true if state == :s
    end

    false
  end

end
