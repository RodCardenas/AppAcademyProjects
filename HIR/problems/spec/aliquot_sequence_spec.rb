require 'rspec'
#### Aliquot Sequence ####
# A number's aliquot sum is the sum of all of its factors excluding itself.
#
# For example, the aliquot sum of 10 is: 1 + 2 + 5 = 8
#
# We can use the aliquot sum to define a special sequence, called the
# aliquot sequence. The aliquot sequence of a number begins with the
# number itself. The second number in the sequence is the first number's
# aliquot sum, the third number is the second number's aliquot sum, and
# so on.
#
# For example, the first 4 numbers in the aliquot sequence of 10 are: 10, 8, 7, 1
#
# Write a function that takes in two numbers, base and n, and returns the
# aliquot sequence of length n starting with base.
#
# Examples:
# aliquot_sequence(10, 4) # => [10, 8, 7, 1]
# aliquot_sequence(10, 2) # => [10, 8]
# aliquot_sequence(7, 4) # => [7, 1, 0, 0]

describe "#aliquot_sequence" do

  context 'requirements' do
    it 'returns the correct aliquot sequence' do
      expect(aliquot_sequence(10, 4)).to eq([10, 8, 7, 1])
      expect(aliquot_sequence(15, 5)).to eq([15, 9, 4, 3, 1])
    end

    it 'returns the base as the first item' do
      3.times do
        base = rand(50)
        expect(aliquot_sequence(base, 1).first).to eq(base)
      end
    end

    it 'correctly calculates the aliquot sum' do
      expect(aliquot_sequence(10, 2)[1]).to eq(8)
      expect(aliquot_sequence(7, 2)[1]).to eq(1)
    end

    it 'returns an array of length n' do
      3.times do
        n = rand(1...10)
        expect(aliquot_sequence(42, n).length).to eq(n)
      end
    end
  end

  context 'bonus' do
    it 'returns an array of length 0 if requested' do
      n = 0
      expect(aliquot_sequence(42, n).length).to eq(n)
    end
  end

end
