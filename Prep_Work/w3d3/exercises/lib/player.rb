class Player
  attr_accessor :board, :name, :auto_populate_grid, :ships, :plays

  def initialize(board, name, auto_populate_grid = true)
    @board = board
    @name = name
    @auto_populate_grid = auto_populate_grid
    @ships = []
    @board.populate_grid if auto_populate_grid
    @plays = []
  end

  def count_ships_alive
    cnt = 0
    @ships.each do |ship|
      cnt += 1 if ship.alive?
    end
    cnt
  end

  def setup_board
    puts "#{name}, you are about to setup the ships on your board. Keep in mind:
    -You will have 5 ships to place;
    -Ships may not overlap;
    -Ships are placed using the following notation starting_pos direction i.e. '0,0,r' => [0,0] right;
    - You must place one of each type of ship;
    - The available ships are:
     | Ship type   | Dim |
     | ----------- | --- |
     | Carrier     | 5x1 |
     | Battleship  | 4x1 |
     | Submarine   | 3x1 |
     | Patrol      | 2x1 |
     | Raft        | 1x1 |"
    5.times do |type|
      ship = get_ship_info(type)
      @board.place_ship(ship)
      @ships << ship
    end
    puts "\n#{name}'s board has been set!\n\n"
    # @board.grid.each do |row|
    #     puts row
    # end
  end

  def get_span_for_example(pos, type, dir)
    case dir
    when 'u'
      return "#{pos} #{[pos[0] - type, pos[1]]}"
    when 'd'
      return "#{pos} #{[pos[0] + type, pos[1]]}"
    when 'l'
      return "#{pos} #{[pos[0], pos[1] - type]}"
    when 'r'
      return "#{pos} #{[pos[0], pos[1] + type]}"
    end
  end

  def get_end_pos(pos, type, dir)
    case dir
    when 'u'
      return [pos[0] - type, pos[1]]
    when 'd'
      return [pos[0] + type, pos[1]]
    when 'l'
      return [pos[0], pos[1] - type]
    when 'r'
      return [pos[0], pos[1] + type]
    end
  end

  class HumanPlayer < Player

    def initialize(board, name, auto_populate_grid)
      super(board, name, auto_populate_grid)
    end

    def get_play(board)
      begin
        puts "\n#{@name}, please input position on board to attack in the form of '0,1':"
        attack_pos = gets.chomp.split(",")

        attack_pos.map! do |coordinate|
          coordinate.to_i
        end
      end until board.in_range?(attack_pos)

      attack_pos
    end

    def get_ship_info(type)
      playable_grid_size = @board.grid.length - 1

      puts "\n#{@name}, please input position to place #{Ship::SHIPS[type]} in the form of 'row,col,dir' where 'row,col' is the beginning position and dir is the direction in which to lay the ship.\n\nThe beggining position ranges from 0,0 to #{playable_grid_size},#{playable_grid_size} and dir can be:\nu for up\nd for down\nl for left\nr for right\n\nFor example:\n0,0,r for #{Ship::SHIPS[type]} => #{get_span_for_example([0,0],type,'r')}\n\nRemember the board is #{playable_grid_size + 1} x #{playable_grid_size + 1} meaning it spans [0,#{playable_grid_size}] horizontally and vertically.\nTime to place the #{Ship::SHIPS[type]} which spans #{type + 1} block from where it is placed either horizontally or vertically:\nrow,col,dir"

      ship_pos = gets.chomp.split(",")

      if ship_pos.length != 3
        raise "ERROR: Invalid coordinate entered."
      end

      start_pos = [ship_pos[0].to_i, ship_pos[1].to_i]
      direction = ship_pos[2]

      if start_pos[0] > playable_grid_size || start_pos[1] > playable_grid_size
        raise "ERROR: Ship placed out of playable bounds."
      elsif start_pos[0] < 0 || start_pos[1] < 0
        raise "ERROR: Ship placed out of playable bounds."
      end

      ship = Ship.new(
                type,
                start_pos, get_end_pos(start_pos,type,direction)
              )
    end

  end

  class ComputerPlayer < Player

    def initialize(board, name, auto_populate_grid = true)
      super(board, name, false) #only human players will be able to set their own board
    end

    def get_ship_info(type)
      start_pos = @board.place_random_ship
      direction = @board.random_direction(type + 1, start_pos)
      ship = Ship.new(
        type,
        start_pos, get_end_pos(start_pos,type,direction)
      )
      # p ship
    end

    def get_play(board)
      begin
        rIndex = Random.new.rand(@board.grid.size)
        cIndex = Random.new.rand(@board.grid[0].size)
        attack_pos = [rIndex, cIndex]
      end until !@plays.include?(attack_pos)
      @plays << attack_pos
      attack_pos
    end

  end

end
