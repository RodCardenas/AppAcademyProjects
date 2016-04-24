def is_prime?(num)
  n = 2

  while n < num
    return false if (num % n).zero?
    n += 1
  end

  true
end

# Arrays
a = Array.new(100,"yes")

a.each_with_index do |el,idx|
  a[idx] = "no" if idx % 2 == 1
end

# p a[0..9]
# p a[-10..-1]

# Ranges
# p (30..50).to_a

def letters_before(char)
  ("a"...char).to_a
end

# p letters_before("d")

def to_range(arr)
  (arr[0]..arr[-1])
end

# p to_range([4, 5, 6, 7])

def any_is_odd?(arr)
  arr.each do |el|
    return true if el.odd?
  end

  false
end

def none_are_odd?(arr)
  arr.each do |el|
    return false if el.odd?
  end

  true
end

def all_are_odd?(arr)
  arr.each do |el|
    return false if el.even?
  end

  true
end

# p any_is_odd?([1,2,3,4])
# p any_is_odd?([2,6,4])
# p none_are_odd?([2,6,4])
# p none_are_odd?([1,2,3,4])
# p all_are_odd?([1,3,5])
# p all_are_odd?([1,2,3,4])

#1 Print every number from 1 to 30 using each and a range. 2 Write a
#function called triplify(arr) which given an array of integers, returns
#a new array with all of the values multiplied by three. 3 Write a
#boolean function called zeroes?(arr) that checks whether an array of
#integers contains at least one 0. 4 First implement this with #each,
#then use a more advanced enumerable boolean method. 5 Write a function
#called all_odd?(arr) that returns whether all of the integers in an
#array are odd. 6 Write a function called squares(arr) that, given an
#array of integers, returns a new array of each number squared.

# (1..30).each do |num|
#   puts num
# end

def triplify(arr)
  arr.map do |num|
    num * 3
  end
end

def zeroes?(arr)
  arr.any? { |n| n.zero? }
end

def all_odd?(arr)
  arr.all? { |n| n.odd? }
end

def squares(arr)
  arr.map do |num|
    num * num
  end
end

# p triplify([1,2,3])
# p zeroes?([0,2,3])
# p zeroes?([1,2,3])
# p all_odd?([1,2,3])
# p all_odd?([1,3])
# p squares([1,2,3])

def word_lengths(str)
  words = str.split(" ")
  word_lengths = {}

  words.each do |word|
    word_lengths[word] = word.length
  end

  word_lengths
end

def uniq(arr)
  uniques = {}

  arr.each do |el|
    uniques[el] = 1 if arr.count(el) == 1
  end

  uniques.keys
end

def greatest_val_key(hash)
  greatest_val = hash.first[1]
  greatest_key = ""

  hash.each do |k,v|
    if v > greatest_val
      greatest_key = k
      greatest_val = v
    end
  end

  greatest_key
end

# p word_lengths("hello my good good pal")
# p uniq([1,2,2,3,4])
# p greatest_val_key({ "a" => 5, "b" => 6, "c" => 3 })

def most_common_number(arr)
  hash = {}

  arr.each do |el|
    if hash.include?(el)
      hash[el] += 1
    else
      hash[el] = 1
    end
  end

  greatest_val_key(hash)
end

def least_frequent_word(str)
if str.nil? || str == "" then (return "") end

  words = str.split(" ")
  hash = {}

  words.each do |el|
    if hash.include?(el)
      hash[el] += 1
    else
      hash[el] = 1
    end
  end

  while true
    try = 1
    hash.each do |k,v|
      return k if v == try
    end
    try += 1
  end
end
p most_common_number([1,2,3,4,4])
p least_frequent_word('hi ho hi hee ho hum ho hum')
