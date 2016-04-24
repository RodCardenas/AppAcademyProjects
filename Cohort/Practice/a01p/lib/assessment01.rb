class Array
  def my_inject(accumulator = nil, &blk)
    i = 0

    if accumulator.nil?
      accumulator = self[0]
      i +=1
    end

    while i < length
      accumulator = blk.call(accumulator,self[i])
      i += 1
    end

    accumulator
  end
end

def is_prime?(num)
  (2...num).none? { |n| num % n == 0}
end

def primes(count)
  primes = []
  return primes if count == 0
  n = 2
  begin
    primes << n if is_prime?(n)
    n += 1
  end until count == primes.length

  primes
end

# the "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  if num == 1
    [1]
  else
    facs = factorials_rec(num-1)
    facs << facs.last * (num - 1)
    facs
  end
end


class Array
  def dups
    positions = Hash.new() { |h,k| h[k] = [] }

    self.each_with_index do |el, idx|
      positions[el] << idx
    end

    positions.select{ |k,v| v.count > 1}
  end
end

class String
  def symmetric_substrings
    subs = []
    self.chars.each_index do |fi|
      self.chars.each_index do |la|
        subs << self[fi..la] unless subs.include?(self[fi..la])
      end
    end

    sym_subs = []
    subs.each do |su|
      sym_subs << su if su == su.reverse && su.length > 1
    end

    sym_subs
  end
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |a,b| a <=> b }

    return self if count <= 1

    Array.merge(
      self.take(count/2).merge_sort(&prc),
      self.drop(count/2).merge_sort(&prc),
      &prc
    )
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end
