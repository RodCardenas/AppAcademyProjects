# ### Digitzer ###
# Write a function that takes a positive integer of any size. It should return
# an array of the integer's digits.
#
# Examples:
# digitize(123) # => [1, 2, 3]
# digitize(546372819) # => [5, 4, 6, 3, 7, 2, 8, 1, 9]
# digitize(0) # => []
#
# Constraints: It should not convert the number to a string at any point or use
# any sort of regular expression.

describe :digitizer do
  context "When given a positive integer" do
      
    it "it returns that integer's digits in an array" do
      expect(digitizer(123)).to eq [1, 2, 3]
      expect(digitizer(546372819)).to eq [5, 4, 6, 3, 7, 2, 8, 1, 9]
    end
    
    # can't figure out how to get this to work
    # it "doesn't call to_s" do
    #     expect_any_instance_of(Fixnum).not_to receive(:to_s)
    # end
  end
  
  context "When given a 0" do
    it "it returns an empty array" do
      expect(digitizer(0)).to eq []
    end
  end

end