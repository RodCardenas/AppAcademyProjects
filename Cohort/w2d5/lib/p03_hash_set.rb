require_relative 'p01_int_set'
require_relative 'p02_hashing'

class HashSet < ResizingIntSet

  def initialize(num_buckets = 8)
    super(num_buckets)
  end

  def insert(key)
    super(key.hash)
  end

  def include?(key)
    super(key.hash)
  end

  def remove(key)
    super(key.hash)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end
