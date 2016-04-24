# O(n^2)
def bad_two_sum?(array, target)
  array.each_index do |i|
    (i+1...array.size).each do |j|
      return true if array[i] + array[j] == target
    end
  end
  false
end

#O(n^2)
def okay_two_sum?(array, target)
  sorted_array = array.sort
  array.each_index do |i|
    (i+1...array.size).each do |j|
      sum = array[i] + array[j]
      next if sum > target
      return true if sum == target
    end
  end
  false
end

def pair_sum?(array, target)
  h1 = Hash.new(false)

  array.each_with_index do |val, idx|
    h1[val] = true
  end

  h1.each do |k,val|
    return true if h1[target - k] && target - k != k
  end

  false
end
