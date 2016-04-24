# Sum
#
# Write an Array method, `sum`, that returns the sum of the elements in the
# array. You may assume that all of the elements are integers.

class Array
  def sum
      s = 0
      self.each do |n|
          s += n
      end
      s
  end
end

# Square
#
# Write an array method, `square`, that returns a new array containing the
# squares of each element. You should also implement a "bang!" version of this
# method, which mutates the original array.

class Array
  def square!
      self.map! do |n|
          n * n
      end
  end

  def square
      self.map do |n|
          n * n
      end
  end
end

# Finding Uniques
#
# Monkey-patch the Array class with your own `uniq` method, called
# `my_uniq`. The method should return the unique elements, in the order
# they first appeared:
#
# ```ruby
# [1, 2, 1, 3, 3].my_uniq # => [1, 2, 3]
# ```
#
# Do not use the built-in `uniq` method!

class Array
  def my_uniq
      unique_values = []
      self.each do |val|
          unique_values << val unless unique_values.include?(val)
      end
      unique_values
  end
end

# Two Sum
#
# Write a new `Array#two_sum` method that finds all pairs of positions
# where the elements at those positions sum to zero.
#
# NB: ordering matters. I want each of the pairs to be sorted smaller
# index before bigger index. I want the array of pairs to be sorted
# "dictionary-wise":
#
# ```ruby
# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# ```
#
# * `[0, 2]` before `[1, 2]` (smaller first elements come first)
# * `[0, 1]` before `[0, 2]` (then smaller second elements come first)

class Array
  def two_sum
      pairs = []
      self.each_with_index do |i,index_i|
          self.each_with_index do |j,index_j|
              if (i + j == 0) then
                  case index_i.<=>index_j
                  when -1
                      pairs << [index_i,index_j] unless pairs.include?([index_i,index_j])
                  when 1
                      pairs << [index_j,index_i] unless pairs.include?([index_j,index_i])
                  end
              end
          end
      end
      pairs
  end
end

# Median
#
# Write a method that finds the median of a given array of integers. If
# the array has an odd number of integers, return the middle item from the
# sorted array. If the array has an even number of integers, return the
# average of the middle two items from the sorted array.

class Array
  def median
      ar = self.sort

      is_odd = ->(n) { n % 2 == 1}
      is_even = ->(n) { n % 2 == 0}

      case ar.length
      when 0
          return nil
      when is_odd
          #p ar.length/2 + 1
          return ar[ar.length/2]
      when is_even
          return (ar[ar.length/2 -1] + ar[ar.length/2]) / 2.0
      end
  end
end

# My Transpose
#
# To represent a *matrix*, or two-dimensional grid of numbers, we can
# write an array containing arrays which represent rows:
#
# ```ruby
# rows = [
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ]
#
# row1 = rows[0]
# row2 = rows[1]
# row3 = rows[2]
# ```
#
# We could equivalently have stored the matrix as an array of
# columns:
#
# ```ruby
# cols = [
#     [0, 3, 6],
#     [1, 4, 7],
#     [2, 5, 8]
#   ]
# ```
#
# Write a method, `my_transpose`, which will convert between the
# row-oriented and column-oriented representations. You may assume square
# matrices for simplicity's sake. Usage will look like the following:
#
# ```ruby
# matrix = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8]
# ]
#
# matrix.my_transpose
#  # => [[0, 3, 6],
#  #    [1, 4, 7],
#  #    [2, 5, 8]]
# ```
#
# Don't use the built-in `transpose` method!

#class Array
#    def my_transpose
#        trans = []
#        self_copy = self.dup
#
#        self_copy.shift.each do |e|
#            a = []
#            a << e
#            trans << a
#        end
#
#        self_copy.length.times do |n|
#            self_copy.shift.each_with_index do |e, index|
#                trans[index] << e
#            end
#        end
#        trans
#    end
#end

# Bonus: Refactor your `Array#my_transpose` method to work with any rectangular
# matrix (not necessarily a square one).

class Array

  def my_transpose

      trans = []
      self_copy = self.dup

      largest_ar_length = 0
      self_copy.each do |ar|
          largest_ar_length = ar.length unless largest_ar_length > ar.length
      end

      self_copy.each do |ar|
          while ar.length < largest_ar_length
              ar << nil
          end
      end

      largest_ar_length.times do |n|
          a = []
          trans << a
      end

      self_copy.length.times do |n|
          self_copy.shift.each_with_index do |e, index|
              trans[index] << e
          end
      end

      #p "trans = #{trans}"
      trans.map! do |ar|
          while ar[-1].nil?
              a = []
              a = ar [0..-2]
              ar = a
          end
          ar
      end

      # If nils are unacceptable as space keepers, block above can be modified to remove all nils (or compact can be used)
      trans

  end

end

#ar = [
#    [1, 6, 9],
#    [2, 7],
#    [3, 8, 10],
#    [4],
#    [5]
#]

#Verified transpose of transpose is the original
#p "ar = #{ar}"
#p "ar.my_transpose = #{ar.my_transpose}"
#p "ar.my_transpose.my_transpose = #{ar.my_transpose.my_transpose}"
