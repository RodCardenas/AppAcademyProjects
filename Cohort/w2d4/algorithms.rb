# O(n^2)
def my_min(array)
  min = array.first
  array.each do |el|
    array.each do |el2|
      next if el == el2
      min = [[el,el2].min, min].min
    end
  end
  min
end

# p my_min([ 0, 3, 5, 4, -5, 10, 1, 90 ])

#O(n)
def my_min2(array)
  min = array.first
  array.each do |el|
    min = [el, min].min
  end
  min
end

# p my_min2([ 0, 3, 5, 4, -5, 10, 1, 90 ])
# O(n^2)
def largest_contiguous_sum(array)
  subsets = []
  subarr = []


  array.each_index do |i|
    array.each_index do |j|
      next if j < i
      subsets << array[i..j] unless subsets.include? array[i..j]
    end
  end
  sum = 0
  subsets.each do |sarr|
    next if sarr.empty?
    sum = [sarr.inject(:+), sum].max
  end
  sum
end

# p largest_contiguous_sum([5, 3, -7,1,5])

# O(n)
def largest_contiguous_sum2(array)
  sum = array.first
  max_sum = array.first
  array.each_with_index do |el,idx|
    next if idx == 0

    if el > sum && sum < 0
      sum = el
    else
      sum += el
    end

    if sum < max_sum
      sum = el
    else
      max_sum = sum
    end
  end
  max_sum
end

# nlog(n)?
def lcs(array)
  return 0 if array.size == 0
  return array.first if array.size == 1

  mid = array.size / 2
  middle = array[mid]

#
  # print "[left] = #{array.take(mid)} "
  # print "middle =  #{middle} "
  # puts "[right] =  #{array.drop(mid+1)} "
  # puts ""
  left = lcs array.take(mid)
  right = lcs array.drop(mid+1)

#
  # print "left = #{left} "
  # print "middle =  #{middle} "
  # puts "right =  #{right} "
  # puts ""


#
  # print "left2 = #{left2} "
  # print "middle =  #{middle} "
  # puts "right2 =  #{right2} "
  # puts "#{  [left2, middle, right2, left + right + middle].max}"

  [
    left,
    middle,
    right,
    left+middle,
    right+middle,
    left+middle+right
  ].max
end

# p largest_contiguous_sum([-5, -3, -7, 1 , 5])
# p largest_contiguous_sum2([-5, -3, -7, 1, 5])
