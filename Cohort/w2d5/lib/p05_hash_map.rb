require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :store
  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = num_buckets
    @num_el = 0
  end

  def include?(key)
    @store[key.hash % @count].include?(key)
  end

  def count
    @num_el
  end

  def set(key, val)
    if self.include?(key)
      self.delete(key)
    else
      @num_el += 1
    end

    @store[key.hash % @count].insert(key, val)
    resize! if @num_el > @count
  end

  def get(key)
    @store[key.hash % @count].get(key)
  end

  def delete(key)
    @store[key.hash % @count].remove(key) ? @num_el -= 1 : nil
  end

  def each(&prc)
    @store.each do |ll|
      ll.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @count
  end

  def resize!
    @count.times { @store << LinkedList.new }
    @count *= 2

    # @store.each_with_index do |ll, idx|
    #   puts "idx = #{idx}"
    #   puts ll
    # end

    @store.each_with_index do |ll, idx|
      # p ll
      ll.each do |node|
        break if node.nil?
        k_idx = node.key.hash % @count
        if idx != k_idx
          p "changed something"
          @store[k_idx].insert(node.key, node.val) unless @store[k_idx].include?(node.key)
          @store[idx].remove(node.key)
        end
      end
    end

    # p "after"
    # @store.each_with_index do |ll, idx|
    #   puts "idx = #{idx}"
    #   puts ll
    # end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
