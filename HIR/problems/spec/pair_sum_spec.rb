#### Pair Sum ####
# Write a function that accepts an array of numbers and a target.
# Find the pairs of indices whose elements sum to the target.
# No pair should appear twice in the result.
#
# Example 1:
# target = 10
# ary = [2, 4, 8]
# pairs = pair_sum(ary, target)
# pairs # => [[0, 2]]
#
# Example 2:
# target = 3
# ary = [1, 3, 0, 2, 1]
# pairs = pair_sum(ary, target)
# pairs # => [[0, 3], [1, 2], [3, 4]]
#
# Constraints:
# * Do not use looping constructs other than `while` loops
# * Do not call any methods on the input array except for [], []=, and length.

def order_agnostic_pair_sum(arr, target)
  pair_sum(arr, target).each(&:sort!).sort!
end

describe "#pair_sum" do

  context 'requirements' do

    it 'returns pairs of indices that sum to the target' do
      pairs = order_agnostic_pair_sum([1, 5, 9, 4, 6, 5, 2], 10)
      expect(pairs).to eq [[0, 2], [1, 5], [3, 4]]
    end

    it 'does not call any methods on the input except #[], #[]=, and #length' do
      # simulate an array of 5 items all of which are 5
      ary = instance_double("Array")
      allow(ary).to receive(:[]).and_return(5)
      allow(ary).to receive(:[]=).and_return(5)
      allow(ary).to receive(:length).and_return(5)

      pair_sum(ary, 1)
    end

    it 'returns empty when given empty' do
      pairs = order_agnostic_pair_sum([], 1)
      expect(pairs).to eq []
    end

    it 'returns empty if the target cannot be summed' do
      pairs = order_agnostic_pair_sum([1, 5, 9, 7, 6, 5, 2], 5)
      expect(pairs).to eq []
    end

    it 'doesn\'t duplicate pairs' do
      pairs = order_agnostic_pair_sum([2, 2], 4)
      expect(pairs).not_to eq([[0, 1], [0, 1]])
    end

    it 'doesn\'t sum a number with itself' do
      pairs = order_agnostic_pair_sum([5], 10)
      expect(pairs).to eq []
    end

    it 'dereferences array indices before comparison' do
      pairs = order_agnostic_pair_sum([2, 2], 1).uniq!
      expect(pairs).not_to eq([[0, 1]])
    end

    it 'matches a duplicated number twice' do
      pairs = order_agnostic_pair_sum([1, 2, 2], 3)
      expect(pairs).to eq [[0, 1], [0, 2]]
    end

    it 'increments the inside iterator' do
      pairs = order_agnostic_pair_sum([0, 1, 2], 3)
      expect(pairs).not_to eq []
    end
  end
end
