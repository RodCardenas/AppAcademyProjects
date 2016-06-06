#### Unique Items ####
# Write a function that takes in an array. It should return a new array
# containing only the elements that were unique in the original array.
#
# For example:
# ary = [1, 5, 5, 7, 16, 8, 1, 8]
# unique = unique_items(ary)
# unique # => [7, 16]

describe "#unique_items" do

  context 'requirements' do
    it 'returns empty when given empty' do
      expect(unique_items([])).to eq []
    end

    it 'selects only unique items' do
      ary = [1, 5, 5, 7, 'sixtyten', 'orange', 1, 'orange']
      expect(unique_items(ary)).to eq [7, 'sixtyten']
    end

    it 'returns empty when no items are unique' do
      expect(unique_items([1, 'a', :b, :b, 'a', 1, 'a'])).to eq []
    end
  end

  context 'old rules' do
    it 'does not call any Array methods but #[], #[]=, and #length' do
      # simulate an array of 5 items all of which are 5
      ary = instance_double("Array")
      allow(ary).to receive(:[]).and_return([5])
      allow(ary).to receive(:[]=).and_return(5)
      allow(ary).to receive(:length).and_return(5)

      unique_items(ary)
    end
  end
end
