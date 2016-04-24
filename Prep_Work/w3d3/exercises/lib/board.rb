class Board
  attr_reader :grid

  WIDTH = 10
  HEIGHT = 10

  def self.default_grid
    Array.new(WIDTH){ Array.new(HEIGHT) }
  end

  def initialize(grid = nil)
    grid.nil? ? @grid = Board.default_grid : @grid = grid
  end

  def count
    cnt = 0
    @grid.each do |row|
      row.each { |col| if col == :s then cnt +=1 end}
    end

    cnt
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def empty?(pos = nil)
    if pos.nil?
      self.count > 0 ? false : true
    else
      @grid[pos[0]][pos[1]].nil?
    end
  end

  def full?
    @grid.each do |row|
      row.each { |col| if col.nil? then return false end }
    end
    true
  end

  def place_random_ship
    if full?
      raise "ERROR:Board is full! No more ships may be added."
    else
      begin
        rIndex = Random.new.rand(@grid.size)
        cIndex = Random.new.rand(@grid[0].size)
      end until empty?([rIndex,cIndex])
      # @grid[rIndex][cIndex] = :s
      [rIndex,cIndex]
    end
  end

  def random_direction(size, start_pos)
    directions = ['u','d','l','r']

    if start_pos[0] - size < 0
      return 'd'
    elsif size + start_pos[0] >= @grid[0].size
      return 'u'
    elsif size + start_pos[1] >= @grid[0].size
      return 'l'
    elsif start_pos[1] - size < 0
      return 'r'
    else
      return directions[Random.new.rand(4)]
    end

  end

  def won?
    @grid.each do |row|
      row.each do |col|
        if col == :s
          return false
        end
      end
    end

    p @grid
    true
  end

  def populate_grid
    (Random.new.rand(@grid.size - 1) + 1).times do |time|
      place_random_ship
    end
  end

  def place_ship(ship)
    st_row_index = ship.start_pos[0]
    st_col_index = ship.start_pos[1]
    end_row_index = ship.end_pos[0]
    end_col_index = ship.end_pos[1]

    rIndex = st_row_index
    while rIndex <= end_row_index

      cIndex = st_col_index
      while cIndex <= end_col_index
        @grid[rIndex][cIndex] = :s

        cIndex +=1
      end
      rIndex +=1
    end

    puts "#{ship.type} has been placed!"
    # self.grid.each do |row|
    #   row.each do |col|
    #     print "#{col}, "
    #   end
    #   puts
    # end
  end

  def in_range?(pos)
    if (pos[0] > (@grid.size - 1)) || (pos[1] > (@grid[0].size - 1))
      puts "Attack coordinates are out of board range. Please try again."
      false
    else
      true
    end
  end

  #display was optimized to work with grids of size <= 10 x 10
  def display
    add_header_to_display
    add_horizontal_line_to_display

    @grid.each_with_index do |row, index|
      add_row_to_display(row, index)
    end
  end

  def add_header_to_display
    print "\n  |"
    WIDTH.times do |time|
      print "#{time}|"
    end
  end

  def add_horizontal_line_to_display
    print "\n"
    (WIDTH * 2 + 3).times do |time|
      print "-"
    end
    print "\n"
  end

  def add_row_to_display(row, index)
    print "#{index} |"
    row.each { |col| col.nil? || col == :s ? (print " |") : (print "#{col}|") }
    add_horizontal_line_to_display
  end

end
