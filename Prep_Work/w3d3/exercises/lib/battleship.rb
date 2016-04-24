class BattleshipGame
  attr_reader :current_player, :other_player

  def initialize(player1, player2)
    @current_player = player2
    @other_player = player1
  end

  def attack(pos)
    if @other_player.board.grid[pos[0]][pos[1]] == :s
      puts "Ship was hit!"

      @other_player.ships.each_with_index do |ship,idx|
        ship.positions.each do |position,state|
          if pos == position
            state = :o
          end
          @other_player.ships[idx].positions[position] = state
        end
        @other_player.ships[idx] = ship
      end

      @other_player.board.grid[pos[0]][pos[1]] = :o
    else
      @other_player.board.grid[pos[0]][pos[1]] = :x
    end
  end

  def count
    @other_player.board.count
  end

  def game_over?
    # @other_player.board.won? || @other_player.board.full?

    @other_player.board.full? || @other_player.ships.count{ |ship| ship.alive? } == 0
  end

  def play_turn
    attack(@current_player.get_play(@other_player.board))
  end

  def play
    puts "welcome to BattleShip!\n\n"
    setup_player_boards

    begin
      change_players
      update_display
      play_turn
      update_display
    end until game_over?
    display_ending_conditions
  end

  def setup_player_boards
    current_player.setup_board
    other_player.setup_board
  end

  def change_players
    @current_player, @other_player = @other_player, @current_player
  end

  def update_display
    display_status
    @other_player.board.display
  end

  def display_status
    puts "\nIt is #{@current_player.name}'s turn\n"
    puts "#{@other_player.name}'s Board is #{@other_player.board.full? ? "full" : "not full"} and #{@other_player.ships.count{ |ship| ship.alive? }} ship(s) are left on the board."
  end

  def display_ending_conditions
    if @other_player.board.won?
      puts "You have sunken all the ships! You won and have defeated #{@other_player.name}!!!"
    elsif @other_player.board.full?
      update_display
      puts "You have failed to sink all the ships! You have been defeated by #{@@other_player.name}!!!"
    end
  end

end
