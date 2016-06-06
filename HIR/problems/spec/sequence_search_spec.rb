#### Sequence Search ####
# You are given two strings, a sequence and a key. Write a function that
# determines if the characters of the key appear in order (although not
# necessarily contiguously) in the sequence.
#
# Example:
# sequence_search("a cat", "cat") # => true
# sequence_search("c1a2t3", "cat") # => true
# sequence_search("cta", "cat") # => false
# sequence_search("caat", "cat") # => true
#
# Constraint:
# * You may not use Regular Expressions (RegExp) in your solution.

describe "#sequence_search" do

  context 'requirements' do
    it 'returns false if pattern is not found' do
      expect(sequence_search("cba", "abc")).to be false
    end

    it 'returns true if pattern is found contiguously' do
      expect(sequence_search('1abc2', 'abc')).to be true
    end

    it 'returns true if pattern is found non-contiguously' do
      expect(sequence_search("a1b2c3", "abc")).to be true
    end

    it 'isn\'t fooled by part of the key showing up before the first character' do
      expect(sequence_search("ayah", "yah")).to be true
    end

    it 'isn\'t thrown off by repeated characters in the key' do
      expect(sequence_search("haha", "aha")).to be true
    end

    it 'isn\'t thrown off by repeated characters in the sequence' do
      expect(sequence_search("good", "god")).to be true
    end

    it 'returns false when sequence is empty but key is not' do
      expect(sequence_search('', 'a')).to be false
    end
  end

  context 'bonus' do
    it 'always returns true if key is an empty string' do
      expect(sequence_search('', '')).to be true
      expect(sequence_search('anything', '')).to be true
    end
  end
end
