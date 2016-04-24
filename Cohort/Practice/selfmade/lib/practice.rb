class Array

  def my_each()
    0.upto(self.size - 1) do |n|
      yield(self[n])
    end
    self
  end

  def my_select()
    selection = []
    self.my_each do |n|
      selection << n if yield(n)
    end
    selection
  end

  def my_reject()
    rejection = []
    self.my_each do |n|
      rejection << n unless yield(n)
    end

    rejection
  end

  def my_any?()
    self.my_each do |n|
      return true if yield(n)
    end

    false
  end

  def my_all?()
    self.my_each do |n|
      return false unless yield(n)
    end
    true
  end

  def my_none?()
    self.my_each do |n|
      return false if yield(n)
    end
    true
  end

  def my_flatten(level = nil)
    arr = []
    level ||= -1
    self.my_each do |el|
      arr << el unless el.is_a?(Array)
      if el.is_a?(Array) && level == 0
        arr += [el]
        return arr
      end
      arr += el.my_flatten(level - 1) if el.is_a?(Array) && level != 0
    end
    arr
  end

  def my_zip(*args)
    zipped = []
    0.upto(self.length - 1) do |n|
      zipped << get_value_for_each_array_at(*args, n).unshift(self[n])
    end
    zipped
  end

  def my_rotate(places = 1)
    places %= self.length
    self.drop(places) + self.take(places)
  end

  def my_join(char = "")
    joined = ""
    self.my_each do |el|
      joined += el + char
    end

    joined[0..-2]
  end

  def my_reverse
    return [self[0]] if self.length == 1
    self[1..-1].reverse + [self[0]]
  end

  def my_map
    mapped = []
    self.my_each do |n|
      mapped << yield(n)
    end

    mapped
  end

  def my_inject(accum = nil)
    accum ||= self[0]

    1.upto(self.length - 1) do |n|
      accum = yield(accum, self[n])
    end

    accum
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |a,b| a > b }

    begin
      swapped = false

      1.upto(self.length - 1) do |i|
        a = self[i - 1]
        b = self[i]

        if prc.call(a,b) == true || prc.call(a,b) == 1
          self[i - 1], self[i] = b, a
          swapped = true
        end

      end
    end until swapped == false
    self
  end

  def bubble_sort(&prc)
    arr = self.dup
    arr.bubble_sort!
  end

  private
  def get_value_for_each_array_at(*args, idx)
    values = []
    args.each do |arr|
      values << arr[idx]
    end
    values
  end

end

def factors(num)
  factors = []

  1.upto(num) do |n|
    factors << n if num % n == 0
  end
  factors
end

def substrings(string)
  subs = []
  string.chars.each_index do |first_ch|
    string.chars.each_index do |last_ch|
      subs << string[first_ch..last_ch] unless subs.include?(string[first_ch..last_ch])
    end
  end
  subs
end

def subwords(word, dictionary)
  subs = []

  substrings(word).each do |pos_word|
    subs << pos_word if dictionary.include?(pos_word) && !subs.include?(pos_word)
  end
  subs
end

def doubler(arr)
  arr.map do |n|
    n * 2
  end
end

def concatenate(strings)
  strings.inject(&:+)
end
# a = [2, 4, 6]
# return_value = a.my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# p return_value
# p a.my_select { |num| num > 1 } # => [2, 4, 6]
# p a.my_select { |num| num == 4 } # => [4]
# p a.my_reject { |num| num > 1 } # => []
# p a.my_reject { |num| num == 4 } # => [2, 6]
# p a.my_any? { |num| num < 1 } # => false
# p a.my_any? { |num| num == 4 } # => true
# p a.my_all? { |num| num < 4 } # => false
# p a.my_all? { |num| num > 1 } # => true
# p a.my_none? { |num| num < 4 } # => false
# p a.my_none? { |num| num > 6 } # => true
# a = [1, 2, 3, [4, [5, 6]], [[[7]], 8]]
# b = [1,[2,3]]
# b.my_flatten
# a.my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
# c = [10, 11, 12]
# d = [13, 14, 15]
# [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"
# [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# [ 1 ].my_reverse               #=> [1]
