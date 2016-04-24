# require "byebug"
require "./lib/hangman"


lines = File.readlines(ARGV[0])

dictionary = lines.map do |line|
  line.chomp
end

players = {
  :referee => ComputerPlayer.new(dictionary),
  :guesser => HumanPlayer.new(dictionary)
  }

game = Hangman.new(players)
# debugger
game.play
