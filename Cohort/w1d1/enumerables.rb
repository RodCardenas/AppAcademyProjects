class Array

  def my_each
    counter = 0

    while counter < self.length
      yield (self[counter])
      counter += 1
    end

    self
  end

  def my_select
    selection = []

    self.my_each do |el|
      selection << el if yield (el)
    end

    selection
  end

  def my_reject
    selection = []

    self.my_each do |el|
      selection << el unless yield (el)
    end

    selection
  end

  def my_any?
    self.my_each do |el|
      return true if yield(el)
    end

    false
  end

  def my_all?
    self.my_each do |el|
      return false unless yield(el)
    end

    true
  end

  def my_flatten( arr = [] )

    self.map do |el|
      if el.is_a?(Array)
        el.my_flatten(arr)
      else
        arr << el
      end
    end
    arr
  end

  def my_zip(*arg)
    zipped = []

    self.each_index do |idx|
      sub_ar = array_builder(*arg,idx)
      sub_ar.unshift(self[idx])

      zipped << sub_ar
    end
    zipped
  end

  def array_builder(*arg, index)
    result = []
    arg.each do |arr|
      result << arr[index]
    end

    result
  end

  def my_rotate (num = 1)
    num = self.length + num if num < 0
    num.times do
      self << self.shift
    end
    self
  end

  def my_join(sep = "")
    joined = ""
    self.each do |el|
      joined << el
      joined << sep
    end
    sep == "" ? joined : joined[0...-1]
  end

  def my_reverse
    reversed = []
    self.each do |el|
      reversed.unshift(el)
    end
    reversed
  end
end

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]
#a = [ "a", "b", "c", "d" ]
#p a.my_join         # => "abcd"
#p a.my_join("$")    # => "a$b$c$d"

#a = [ "a", "b", "c", "d" ]
#p a.my_rotate         #=> ["b", "c", "d", "a"]
#a.my_rotate(2)      #=> ["c", "d", "a", "b"]
#p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
#p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


# return_value = [1, 2, 3].my_each do |num|
#    puts num
#  end.my_each do |num|
#    puts num
#  end
#
#  p return_value
 # a = [1, 2, 3]
 # p a.my_select { |num| num > 1 } # => [2, 3]
 # p a.my_select { |num| num == 4 } # => []
 # a = [1, 2, 3]
 # p a.my_reject { |num| num > 1 } # => [1]
 # p a.my_reject { |num| num == 4 } # => [1, 2, 3]
 # a = [1, 2, 3]
 # p a.my_any? { |num| num > 1 } # => true
 # p a.my_any? { |num| num == 4 } # => false
 # p a.my_all? { |num| num > 1 } # => false
 # p a.my_all? { |num| num < 4 } # => true
 # p [1, 2, 3, [4]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
 # p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

 # a = [ 4, 5, 6 ]
 # b = [ 7, 8, 9 ]
 # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
 # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
 # p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]
 #
 # c = [10, 11, 12]
 # d = [13, 14, 15]
 # p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
