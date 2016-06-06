#### Merger ####

# Write a function that takes in two sorted arrays and returns a sorted array that is the
# combination of the two input arrays (don't use #sort!). You may iterate at most once through
# each array (i.e. no nested loops).

describe "#merger" do

  it 'returns a sorted array with all elements' do
    left = rand_sorted_array(5)
    right = rand_sorted_array(5)
    expect(merger(left, right)).to eq((left + right).sort!)
  end

  it 'handles arrays of different lengths' do
    left = rand_sorted_array(3)
    right = rand_sorted_array(6)
    expect(merger(left, right)).to eq((left + right).sort!)
  end

  it 'handles empty arrays' do
    non_empty = rand_sorted_array(5)

    expect(merger(non_empty, [])).to eq(non_empty)
    expect(merger([], non_empty)).to eq(non_empty)
    expect(merger([], [])).to eq([])
  end

end

def rand_sorted_array(length)
  Array.new(length) { rand(100) }.sort!
end
