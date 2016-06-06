#### Winning Streak ####
# You are a professional chess player. Your competitive record is stored as a
# string of 'W's and 'L's, signifying matches you've won and lost. Write a
# function that determines your longest winning streak from a given record.
#
# Examples:
# winning_streak("LW") # => 1
# winning_streak("LL") # => 0
# winning_streak("WWW") # => 3
# winning_streak("WLLWWWLW") # => 3

describe "#winning_streak" do

  context 'requirements' do
    it 'handles rocords that only contain Ws' do
      expect(winning_streak("WWW")).to eq 3
    end

    it 'handles rocords that only contain Ls' do
      expect(winning_streak("LLL")).to eq 0
    end

    it 'handles multiple streaks' do
      expect(winning_streak("WLWWWLWW")).to eq 3
    end

    it 'handles records that end with W' do
      expect(winning_streak("WLWWLWWW")).to eq 3
    end

    it 'handles records that end with L' do
      expect(winning_streak("WLWWLWWWL")).to eq 3
    end
  end

  context 'bonus' do
    it 'is case insensitive' do
      expect(winning_streak("wlwWwLWw")).to eq 3
    end

    it 'ignores invalid characters' do
      expect(winning_streak("/W4[W7eW;")).to eq 3
    end
  end
end
