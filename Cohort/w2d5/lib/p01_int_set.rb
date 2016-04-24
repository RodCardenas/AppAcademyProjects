require 'byebug'

class MaxIntSet
  def initialize(max = 10 )
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet

  def initialize(count = 20)
    @count = count
    @store = Array.new(count){ Array.new() }
    @num_el = 0
  end

  def insert (int)
    @store[int % @count] << int unless self.include?(int)
    @num_el += 1
  end

  def remove (int)
    @store[int % @count].delete(int)
    @num_el -= 1
  end

  def include?(int)
    @store[int % @count].include?(int)
  end


  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet < IntSet

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = num_buckets
    @num_el = 0
  end

  def count
    @num_el
  end

  def insert(int)
    # byebug
    super(int)
    resize! if @num_el > @count
  end


  def include?(num)
    return false if @count == 0
    super(num)
  end


  private

  def resize!
    @count.times {@store << Array.new()}
    @count *= 2

    @store.each_with_index do |arr, idx|
      arr.each do |el|
        if idx != el % @count
          @store[el % @count] << el unless @store.include?(el)
          @store[idx].delete(el)
        end
      end
    end

  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @count
  end
end

r = ResizingIntSet.new
6.times do |n|
  r.insert(n)
end
