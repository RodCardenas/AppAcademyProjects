require "./lib/battleship"
require "./lib/board"
require "./lib/player"
require "./lib/ship"


p1 = Player::HumanPlayer.new(Board.new, "Human", false)
# puts p1.name
# p1.board.grid.each do |row|
#   print row
#   puts ""
# end
# puts ""
p2 = Player::ComputerPlayer.new(Board.new, "AI")
# puts p2.name
# p2.board.grid.each do |row|
#   print row
#   puts ""
# end
# puts ""
g = BattleshipGame.new(p1, p2)
g.play
