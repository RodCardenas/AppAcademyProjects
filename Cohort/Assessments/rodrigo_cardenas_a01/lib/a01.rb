class Array
  # Write an Array method that returns a bubble-sorted copy of an array
  def bubble_sort(&prc)
    arr = self.dup
    arr.bubble_sort!(&prc)
  end

  # You are not required to implement this; it's here as a suggestion :-)
  def bubble_sort!(&prc)

    begin
      swapped = false
      i = 1

      while i < length
        a = self[i - 1]
        b = self[i]

        if prc.nil?
          if a > b
            self[i - 1], self [i] = b, a
            swapped = true
          end
        else
          if prc.call(a,b) == 1
            self[i - 1], self [i] = b, a
            swapped = true
          end
        end
        i += 1
      end

    end until !swapped
    self
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target = 0)
    pairs = []
    self.each_with_index do |num, idx|
      self.each_with_index do |num2, idx2|
        next if idx == idx2
        pairs << [idx,idx2] if (num + num2 == target) && !pairs.include?([idx,idx2]) && !pairs.include?([idx2,idx])
      end
    end
    p pairs
    pairs
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nexted arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil)
    arr = []
    level ||= -1

    return self if level == 0

    self.each do |el|
      if !el.is_a?(Array)
        arr << el
        next
      end

      if el.is_a?(Array) && level == 0
        arr += el
        return arr
      end

      if el.is_a?(Array) && level != 0
        arr += el.my_flatten(level - 1)
      end

    end

    # p arr
    arr
  end
end

class String
  # This method returns true if the sentence passed as an argument
  # can be created by rearranging the receiving string.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cats are cool".shuffled_sentence_detector("cool cats are") => true

  def shuffled_sentence_detector(other)
    sent1_chars = Hash.new(0)
    self.chars.each do |c|
      sent1_chars[c] += 1
    end

    sent2_chars = Hash.new(0)
    other.chars.each do |c|
      sent2_chars[c] += 1
    end

    sent1_chars.each do |k,v|
      return false unless sent1_chars[k] == sent2_chars[k]
    end

    true
  end
end

def prime?(num)
  (2...num).none? { |n| num % n == 0}
end

# Write a method that sums the first n prime numbers starting with 2.
def sum_n_primes(n)
  primes = []
  return 0 if n == 0
  i = 2
  begin
    primes << i if prime?(i)
    i += 1
  end until primes.length == n

  sum = 0
  primes.each do |num|
    sum += num
  end

  sum
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&blk)
    0.upto(self.length - 1) do |n|
      blk.call(self[n])
    end
    self
  end
end

class Array
  def my_inject(accumulator = nil, &blk)
    i = 0

    if accumulator.nil?
      accumulator = self[0]
      i += 1
    end

    while i < length
      accumulator = blk.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end
