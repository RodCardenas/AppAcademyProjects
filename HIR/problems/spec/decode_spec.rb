#### Decode ####
# You are given an encoded string. The code is defined as follows:
# * Each character in the encoded string is followed by a single-digit number.
# * The number represents how many times the character appears in a row.
#
# Write a function that takes in an encoded string and returns the original.
#
# Example:
# encoded_string = "m1i1s2i1s2i1p2i1"
# decoded_string = decode(encoded_string)
# decoded_string # => "mississippi"

describe "#decode" do

  it 'decode the encoded string' do
    expect(decode("m1i1s2i1s2i1p2i1")).to eq "mississippi"
  end

  it 'does not try to append odd indices' do
    expect(decode("aa2a")).to eq ""
  end

  it 'treats numbers as characters when index is even' do
    expect(decode('1234')).to eq '113333'
  end
end
