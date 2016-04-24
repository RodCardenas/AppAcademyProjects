class MaxIntSet

  def initialize(max)
    @store = Array.new(max){ false }
  end

  def insert (int)
    @store[int] = true
  end

  def remove (int)
    @store[int] = false
  end

  def include?(int)
    @store[int] == true
  end

end

class IntSet

  def initialize(max = 20)
    @max = max
    @store = Array.new(max){ Array.new() }
    @num_el = 0
  end

  def insert (int)
    @store[int % @max] << int unless self.include?(int)
    @num_el += 1
  end

  def remove (int)
    @store[int % @max].delete(int)
    @num_el -= 1
  end

  def include?(int)
    @store[int % @max].include?(int)
  end

end

class ResizingIntSet < IntSet

  def insert(int)
    super(int)

    if @num_el >= @max
      @max.times do |n|
        @store << Array.new()
      end
      @max *= 2
      rebucket
    end

  end

  def rebucket
    p "Before:"
    p @store

    @store.each do |arr|
      arr.each do |el|
        @store[el % @max] << el
      end
    end

    p @store
  end


end
