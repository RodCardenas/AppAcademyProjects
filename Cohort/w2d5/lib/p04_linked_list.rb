class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @tail.prev == @head
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def inspect
    self.each do |node|
      p node.to_s
    end
  end


  def insert(key, val)
    node = Link.new(key,val)

    node.prev = @tail.prev
    node.prev.next = node
    node.next = @tail
    @tail.prev = node

  end

  def remove(key)
    self.each do |node|
      if node.key == key
        node.prev.next, node.next.prev = node.next, node.prev
        node.next = nil
        node.prev = nil
        return true
      end
    end
    false
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def each(&prc)
    node = @head.next

    until node == @tail
      prc.call(node)
      node = node.next
    end

    self
  end

  def to_s
    self.each do |node|
      puts node.to_s
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
