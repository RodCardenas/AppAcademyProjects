# ### Neighbor Sum ###
#
# Write a function that takes an array of integers and returns a new array with
# each element replaced by the sum of its neighbors.
#
# short_array = [2, 3, 5]
# neighbor_sum(short_array) #=> [3, 7, 3]
#
# long_array = [7, 4, 2, 9, 3, 5]
# neighbor_sum(long_array) #=> [4, 9, 13, 5, 14, 3]

describe :neighbor_sum do
  context "When given an empty array" do
    it "returns an empty array" do
      expect(neighbor_sum([])).to eq []
    end
  end
  context "When given an array with one element" do
    it "returns the array [0]" do
      expect(neighbor_sum([0])).to eq [0]
      expect(neighbor_sum([42])).to eq [0]
    end
  end
  context "When given an array with two elements" do
    it "swaps the elements" do
      expect(neighbor_sum([5, 9])).to eq [9, 5]
    end
  end
  context "When given an array of four elements" do
    it "calculates correctly" do
      expect(neighbor_sum([4, 5, 9, 1])).to eq [5, 13, 6, 9]
    end
  end
  context "When given an array with all negative elements" do
    it "calculates correctly" do
      expect(neighbor_sum([-4, -5, -9, -1])).to eq [-5, -13, -6, -9]
    end
  end
end
