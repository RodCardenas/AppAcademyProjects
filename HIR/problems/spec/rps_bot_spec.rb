# ### Rock Paper Scissors Bot ###
#
# 'Rock Paper Scissors' is a simple game for two people. Each player simultaneously
# selects either 'rock', 'paper', or 'scissors',
#
# The winner is determined according to the following rules:
# - 'rock' wins over 'scissors'
# - 'scissors' wins over 'paper'
# - 'paper' wins over 'rock'
#
# Rocky is a robot programmed to play 'Rock Paper Scissors'. He always follows
# the same strategy every time he plays. He keeps track of what move his oppenent
# has been playing the most and plays the corresponding counter move. If his
# oppenent has not favored any particular move over all other moves then Rocky
# will play a random move.
#
# Write a function that takes a string of moves. It should return a string of
# moves that Rocky would make in response. Represent a random move with an 'x'.
#
# rps_bot("rrrr") # => "xppp"
# rps_bot("srrr") # => "xrxp"
# rps_bot("rprs") # => "xpxp"
# rps bot("srpsrp") # => "xrxxrx"
# rps_bot("rpsssprrr") # => "xpxxrrrrx"

describe :rps_bot do
    context "When given an array of moves" do
        it "should return the appropriate response moves" do
            expect(rps_bot("rrrr")).to eq("xppp")
            expect(rps_bot("srrr")).to eq("xrxp")
            expect(rps_bot("rprs")).to eq("xpxp")
            expect(rps_bot("srpsrp")).to eq("xrxxrx")
            expect(rps_bot("rpsssprrr")).to eq("xpxxrrrrx")
        end
    end
    
    context "When given an empty string" do
       it "should return an empty string"  do
          expect(rps_bot("")).to eq("") 
       end
    end
end