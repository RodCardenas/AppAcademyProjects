#### Five Sort ####
# Write a function that accepts an array of numbers. It should return a copy of
# the array, with all instances of the number 5 moved to the end.
# The ordering of the other elements should remain unchanged.
#
# For example:
# nums = [1, 5, 8, 5, 5, 2, 3]
# sorted = five_sort(nums)
# sorted # => [1, 8, 2, 3, 5, 5, 5]

describe "#five_sort" do

  context 'requirements' do
    it 'handles empty arrays' do
      expect(five_sort([])).to eq []
    end

    it 'returns arrays that have no fives unchanged' do
      arr = Array.new(5) { rand(5) }
      expect(five_sort(arr)).to eq(arr)
    end

    it 'sorts arrays with one five' do
      unsorted = [1, 5, 9, 2, 3]
      sorted   = [1, 9, 2, 3, 5]
      expect(five_sort(unsorted)).to eq sorted
    end

    it 'sorts arrays with multiple 5s' do
      unsorted = [1, 5, 9, 5, 2, 3]
      sorted   = [1, 9, 2, 3, 5, 5]
      expect(five_sort(unsorted)).to eq sorted
    end

    it 'sorts arrays with consecutive 5s' do
      unsorted = [1, 5, 9, 5, 5, 2, 3]
      sorted   = [1, 9, 2, 3, 5, 5, 5]
      expect(five_sort(unsorted)).to eq sorted
    end
  end

  context 'bonus' do
    it 'does not modify the original array' do
      unsorted = [5, 1]
      five_sort(unsorted)
      expect(unsorted).to eq [5, 1]
    end
  end
end
