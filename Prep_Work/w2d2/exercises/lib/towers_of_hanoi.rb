# Towers of Hanoi
#
# Write a Towers of Hanoi game:
# http://en.wikipedia.org/wiki/Towers_of_hanoi
#
# In a class `TowersOfHanoi`, keep a `towers` instance variable that is an array
# of three arrays. Each subarray should represent a tower. Each tower should
# store integers representing the size of its discs. Expose this instance
# variable with an `attr_reader`.
#
# You'll want a `#play` method. In a loop, prompt the user using puts. Ask what
# pile to select a disc from. The pile should be the index of a tower in your
# `@towers` array. Use gets
# (http://andreacfm.com/2011/06/11/learning-ruby-gets-and-chomp/) to get an
# answer. Similarly, find out which pile the user wants to move the disc to.
# Next, you'll want to do different things depending on whether or not the move
# is valid. Finally, if they have succeeded in moving all of the discs to
# another pile, they win! The loop should end.
#
# You'll want a `TowersOfHanoi#render` method. Don't spend too much time on
# this, just get it playable.
#
# Think about what other helper methods you might want. Here's a list of all the
# instance methods I had in my TowersOfHanoi class:
# * initialize
# * play
# * render
# * won?
# * valid_move?(from_tower, to_tower)
# * move(from_tower, to_tower)
#
# Make sure that the game works in the console. There are also some specs to
# keep you on the right track:
#
# ```bash
# bundle exec rspec spec/towers_of_hanoi_spec.rb
# ```
#
# Make sure to run bundle install first! The specs assume you've implemented the
# methods named above.

class TowersOfHanoi

  def initialize
    @towers = [[3, 2, 1], [], []]
    @moves = 0
  end

  def towers
    @towers
  end

  def play
    puts "Welcome to Towers of Hanoi!"

    begin
      render

      frm_tower = -1
      begin
        puts "To make a move enter which tower to move from: (0-2)"
        frm_tower = gets.chomp
      end until frm_tower == '0' || frm_tower == '1' || frm_tower == '2'

      to_tower = -1
      begin
        puts "Which tower will disc be moved to: (0-2)"
        to_tower = gets.chomp
      end until to_tower == '0' || to_tower == '1' || to_tower == '2'

      if valid_move?(frm_tower.to_i, to_tower.to_i)
        move(frm_tower.to_i, to_tower.to_i)
      else
        puts "INVALID MOVE... Please try again."
      end

    end until won?

    puts "You won in #{moves} moves!"
  end

  def move(from_tower, to_tower)
    @towers[to_tower].push(@towers[from_tower].pop)
    @moves += 1
  end

  def valid_move?(from_tower, to_tower)
    if @towers[from_tower].empty?
      return false
    else
      if @towers[to_tower].empty?
        return true
      elsif @towers[from_tower].last > @towers[to_tower].last
        return false
      end
    end

    true
  end

  def won?
    if @towers[1].size == 3 || @towers[2].size == 3
      return true
    else
      return false
    end
  end

  def render
    puts ""
    puts "#{@moves} moves so far..."
    puts ""
    puts "T0|T1|T2"
    puts ""
    puts " #{@towers[0][2] || " "}| #{@towers[1][2] || " "}| #{@towers[2][2] || " "}"
    puts " #{@towers[0][1] || " "}| #{@towers[1][1] || " "}| #{@towers[2][1] || " "}"
    puts " #{@towers[0][0] || " "}| #{@towers[1][0] || " "}| #{@towers[2][0] || " "}"
    puts ""
  end

  def moves
    @moves
  end
end

game = TowersOfHanoi.new
game.play
