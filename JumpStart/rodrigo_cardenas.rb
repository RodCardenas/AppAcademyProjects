# Factorial
# ------------------------------------------------------------------------------
# A number factorial is the product of all whole
# numbers between 1 and num multiplied together.
# factorial(4) => 4 * 3 * 2 * 1 => 24
# ------------------------------------------------------------------------------
def factorial(num)
  prod = 1
  1.upto(num) do |n|
    prod *= n
  end

  prod
end
# ------------------------------------------------------------------------------
puts "-------Factorial-------"
puts factorial(1) == 1
puts factorial(4) == 24
puts factorial(5) == 120
puts factorial(10) == 3628800
# ------------------------------------------------------------------------------

# Long Word Count
# ------------------------------------------------------------------------------
# Return the number of words longer than 7 characters
# "cat cactus balderdash phenomenon amazon" has two words over 7 characters long
# "balderdash" and "phenomenon"
# long_word_count("cat cactus balderdash phenomenon amazon") => 2
# ------------------------------------------------------------------------------
def long_word_count(text)
  words = text.split(" ")

  words.select{ |word| word.length > 7}.count
end
# ------------------------------------------------------------------------------
puts "-------Long Word Count-------"
puts long_word_count("") == 0
puts long_word_count("short words only") == 0
puts long_word_count("one reallylong word") == 1
puts long_word_count("two reallylong words inthisstring") == 2
puts long_word_count("allwordword longwordword wordswordword") == 3
puts long_word_count("seventy schfifty five") == 1
# ------------------------------------------------------------------------------

# Least Common Multiple
# ------------------------------------------------------------------------------
# Return the lowest number which is a multiple of both inputs
# the least common multiple of 2 and 3 is 6
# the least common multiple of 6 and 10 is 30
# it is NOT ALWAYS the product of the inputs
# lcm(6, 10) => 30
# ------------------------------------------------------------------------------
def lcm(a, b)
  if a == b then return a end
  uniq_factors = []
  a_factors = []

  a_factors = factorization(a)
  b_factors = factorization(b)

  a_factors.each do |factor|
    uniq_factors << factor unless uniq_factors.include?(factor)
  end

  b_factors.each do |factor|
    uniq_factors << factor unless uniq_factors.include?(factor)
  end

  lcm = 1
  uniq_factors.each do |num|
    lcm *= num
  end

  lcm
end

def factorization(num)
  factors = []
  n = num
  i = 2

  until n == 1
    if n % i == 0
      n = n / i
      factors << i
    end

    i += 1
  end

  factors
end

def is_factor?(num, candidate)
  num % candidate == 0
end

def get_factors(num)
  factors = []
  1.upto(num - 1) do |candidate|
    factors << candidate if num % candidate == 0
  end

  factors
end

def prime_factors(num)
  get_factors(num).select{ |factor| is_prime?(factor)}
end

def is_prime?(num)
  (2...num).none?{ |n| num % n == 0}
end

# ------------------------------------------------------------------------------
puts "-------Least Common Multiple-------"
puts lcm(2, 3) == 6
puts lcm(6, 10) == 30
puts lcm(24, 26) == 312
# ------------------------------------------------------------------------------

# Largest Odd Factors
# ------------------------------------------------------------------------------
# Return an array of the largest odd factors NOT including the number itsself
# The factors of 20 are 1, 2, 5, and 10
# The largest odd factor of 20 is 5 because 10 is even
# largest_odd_factors([10, 20, 30]) => [5, 5, 15]
# ------------------------------------------------------------------------------
def largest_odd_factors(nums)
  largest_odd_factors = []
  odd_factors = []
  nums.each do |num|
     factors = get_factors(num)
     odd_factors = factors.select{ |factor| factor.odd? }
     largest_odd_factors << odd_factors.max
  end
  largest_odd_factors
end

# ------------------------------------------------------------------------------
puts "-------Largest Odd Factor-------"
puts largest_odd_factors([]) == []
puts largest_odd_factors([5]) == [1]
puts largest_odd_factors([26, 27, 28, 29]) == [13, 9, 7, 1]
puts largest_odd_factors([10, 20, 30]) == [5, 5, 15]
# ------------------------------------------------------------------------------

# Fibonacci Sequence
# ------------------------------------------------------------------------------
# The Fibonacci sequence is defined as fib(n) = fib(n - 1) + fib(n - 2).
# The sequence starts with 0 and 1 as the first two Fibonacci numbers
# and builds up from there, each subsequent Fibonacci being the sum of
# the previous two.
#
# Return the first n many Fibonacci numbers, starting with 0.
# fibs(5) => [0, 1, 1, 2, 3]
# ------------------------------------------------------------------------------
def fibs(n)
  fibs = []
  i = 0

  until fibs.length == n
    if fibs.empty?
      fibs.push(0)
    elsif fibs.length == 1
      fibs.push(1)
    else
      fibs[i] = fibs[i - 1] + fibs[i - 2]
    end
    i += 1
  end

  fibs
end
# ------------------------------------------------------------------------------
puts "-------Fibonacci-------"
puts fibs(0) == []
puts fibs(1) == [0]
puts fibs(2) == [0, 1]
puts fibs(3) == [0, 1, 1]
puts fibs(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
# ------------------------------------------------------------------------------

# Hipsterfy
# ------------------------------------------------------------------------------
# Input is a string containing several words.
# Return a string with the last vowel removed from each word. 'y' is not a vowel.
# hipsterfy("towel flicker banana") => "towl flickr banan"
# ------------------------------------------------------------------------------
def hipsterfy(str)
  words = str.split(" ")

  words.each_with_index do |word,idx|
    words[idx] = word.reverse.sub(/[aeiou]/,"").reverse
  end

  words.join(" ")
end
# ------------------------------------------------------------------------------
puts "-------Hipsterfy-------"
puts hipsterfy("proper") == "propr"
puts hipsterfy("proper tonic panther") == "propr tonc panthr"
puts hipsterfy("towel flicker banana") == "towl flickr banan"
puts hipsterfy("runner anaconda") == "runnr anacond"
puts hipsterfy("turtle cheeseburger fries") == "turtl cheeseburgr fris"
# ------------------------------------------------------------------------------

# Repeated Chars
# ------------------------------------------------------------------------------
# Input is a word.
# Return an array of all the characters that appear multiple times consecutively.
# repeated_chars("mississippi") => ["s, s, p"]
# ------------------------------------------------------------------------------
def repeated_chars(word)
  repeated_chars = []
  largest_index_explored = 0

  i = 0
  while i < word.length
    j = i + 1

    while j < word.length - 1
      if word[i] == word[j]
        repeated_chars << word[i]
      end

      largest_index_explored = j
      break
      j += 1
    end

    i += 1
  end

  repeated_chars
end
# ------------------------------------------------------------------------------
puts "-------Repeated Chars-------"
puts repeated_chars("cat") == []
puts repeated_chars("caat") == ['a']
puts repeated_chars("applle") == ['p', 'l']
puts repeated_chars("mississippi") == ['s', 's', 'p']
puts repeated_chars("caataapulllllt") == ['a', 'a', 'l']
# ------------------------------------------------------------------------------
# Pair Product
# ------------------------------------------------------------------------------
# Given an array of numbers and a target product, return whether any pair of
# elements in the array multiplied together equals that product.
# pair_product?([3, 1, 5], 15) => true
# ------------------------------------------------------------------------------
def pair_product?(arr, target_product)
  prods = []

  i = 0
  while i < arr.length
    j = i + 1
    while j < arr.length
      prods << arr[i] * arr[j] unless prods.include?(arr[i] * arr[j])
      j += 1
    end
    i +=1
  end
  prods.include?(target_product)
end
# ------------------------------------------------------------------------------
puts "-------Pair Product-------"
puts pair_product?([5, 10, 15, 20, 25, 30], 75) == true
puts pair_product?([2, 4, 8, 16], 128) == true
puts pair_product?([10, 20], 10) == false
puts pair_product?([1, 2], 4) == false
puts pair_product?([], 1) == false
# ------------------------------------------------------------------------------
