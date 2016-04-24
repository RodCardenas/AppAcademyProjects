class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    str = "" + self.length.to_s

    self.each do |el|
      str += el.class.to_s + el.to_s
    end

    number = ""
    str.each_char do |c|
      number += c.ord.to_s
    end

    number.to_i
  end
end

class String
  def hash
    self.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = 0

    self.each do |k,v|
      num += k.hash + v.hash
    end

    num
  end
end
