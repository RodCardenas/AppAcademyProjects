# ### Ping Pong Filter ###
#
# Imagine that we have a filter that goes through an array and removes every other
# element. When it reaches the final element it turns around and does the whole
# process again, this time going from the end to the start. It repeats this
# behavior until there is only one element left.
#
# For example:
# Given a starting array [1, 2, 3, 4, 5, 6, 7, 8]
# We start from the beginning and remove every other element (indicated with !)
# [!1, 2, !3, 4, !5, 6, !7, 8] = [2, 4, 6, 8]
# Next we start from the end and remove every other element
# [2, !4, 6, !8] = [2, 6]
# Now we start from the beginning again and remove every other element
# [!2, 6] = [6]
#
# Write a method that takes an array of elements. It should return the only
# element that would remain after filtering the array in the manner described
# above.
#
# Examples:
#
# array0 = [1, 2, 3, 4, 5, 6, 7, 8]
# ping_pong_filter(array0) # => 6
#
# array1 = [1, 2, 3, 4]
# ping_pong_filter(array1) # => 2
#
# array2 = [3, 5, 7, 8, 9, 2]
# ping_pong_filter(array2) # => 8
#
# array3 = ["dog", "cat", "rabbit", "hamster", "monkey", "tarantula"]
# ping_ping_filter(array3) #=> "hamster"


describe :ping_pong_filter do
    context "When given an array" do
        array0 = [1, 2, 3, 4, 5, 6, 7, 8]
        array1 = [1, 2, 3, 4]
        array2 = [3, 5, 7, 8, 9, 2]
        array3 = ["dog", "cat", "rabbit", "hamster", "monkey", "tarantula"]

        it "applies the filtering algorithm and return the appropriate element" do
          expect(ping_pong_filter(array0)).to eq 6
          expect(ping_pong_filter(array1)).to eq 2
          expect(ping_pong_filter(array2)).to eq 8
       end
       
       it "should handle any type of element" do
           expect(ping_pong_filter(array3)).to eq "hamster"
       end
    end
    
    context "When given an empty array" do
       it "should return 'nil" do
          expect(ping_pong_filter([])).to be_nil
       end
    end
    
end