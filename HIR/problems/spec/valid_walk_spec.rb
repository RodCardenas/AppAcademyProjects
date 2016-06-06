# ### Valid Walk ####
# You have a walking robot. Given a string of compass directions (e.g., "nesw"
# or "nnssen"), it will travel one mile in each of those directions. Write a
# method to determine whether a set of directions will lead your robot back to
# its starting position.

# Example:
# valid_walk?("nnnn") # => false
# valid_walk?("nenessww") # => true

describe "#valid_walk?" do

  context 'requirements' do
    it 'returns true if the path returns you to your inital position' do
      expect(valid_walk?('nesw')).to be true
    end

    it 'returns false if the path leaves you somewhere else' do
      expect(valid_walk?('nes')).to be false
    end

    it 'keeps the Nort-South and East-West axes separate' do
      expect(valid_walk?('nw')).to be false
    end

    it 'returns true for a complex valid path' do
      expect(valid_walk?('wsseenwwwnnees')).to be true
    end

    it 'returns true for an empty string (no path at all)' do
      expect(valid_walk?('')).to be true
    end
  end

  context 'bonus' do
    it 'is case insensitive' do
      expect(valid_walk?('neSW')).to be true
      expect(valid_walk?('nsE')).to be false
    end

    it 'ignores invalid characters' do
      expect(valid_walk?('yum wendy\'s!')).to be true
      expect(valid_walk?('[not cool], wesley')).to be false
    end
  end
end
