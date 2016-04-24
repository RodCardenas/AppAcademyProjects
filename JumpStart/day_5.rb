def all_word_pairs(str)
  words = str.split(" ")
  pairs = []

  words.each do |word1|
    words.each do |word2|
      pairs << [word1,word2] if word1 != word2 && !pairs.include?([word1,word2])
    end
  end

  pairs
end

p all_word_pairs("a b c")

def any_make_yahtzee?(arr)
  arr.each do |word1|
    arr.each do |word2|
      return true if word1 + word2 == "yahtzee"
    end
  end
  false
end

p any_make_yahtzee?(["yah", "car", "build", "tzee"]) == true
p any_make_yahtzee?(["yahtz", "fish", "y"]) == false

def sum_arr_no_2s(arr)
  arr.reject{ |num| num == 2}.reduce(0){ |sum,num| sum + num }
end

p sum_arr_no_2s([1,2,3,4, 2]) == 8

def longest_str_in_arr(arr)
  arr.max_by{ |word| word.length}
end

p longest_str_in_arr(["one", "two", "three"]) == "three"

def is_prime?(num)
  num <= 1 ? false : (2...num).none?{ |fac| (num % fac).zero? }
end

p is_prime?(4) == false
p is_prime?(7) == true

def primes_less_than(num)
  (2..num).select{ |num| is_prime?(num)}
end

p primes_less_than(10) == [2,3,5,7]

def range_of(arr)
  arr.max - arr.min unless arr.empty?
end

p range_of([1,2,3,6,10]) == 9
p range_of([])

def greatest_uniq(arr)
  nums_ct = Hash.new(0)

  arr.each do |num|
    nums_ct[num] += 1
  end

  nums_ct.select{ |k,v| v == 1}.keys.max
end

p greatest_uniq([1,2,3,6,10,10]) == 6

def greatest_three(arr)
  arr.sort[-3..-1]
end

p greatest_three([1,2,3,6,10]) == [3,6,10]

def lotrify(str)
  str.gsub("Bilbo", "Frodo")
end

p lotrify("Bilbo and his son Bilbo are cool...")

def is_palindrome?(str)
  str == str.reverse
end

def longest_palindrome(str)
  chars = str.chars
  palindromes = []
  chars.each_with_index do |char1,idx1|
    chars.each_with_index do |char2,idx2|
      word = chars[idx1..idx2].join("")
      palindromes << word if is_palindrome?(word)
    end
  end

  palindromes.max_by{ |palindrome| palindrome.length }
end

p longest_palindrome("asddsa notsure what else to typehere")

def longest_run_digit(num)
  digits = num.to_s.chars
  longest_run_digit = digits[0]
  longest_run = 1

  i = 0
  while i < digits.length

    j = i + 1
    current_run = 0
    current_digit = digits[i]
    while digits[j] == current_digit
      current_run += 1
      j += 1
    end

    if current_run > longest_run
      longest_run_digit = current_digit
      longest_run = current_run
    end
    i += 1
  end

  longest_run_digit.to_i
end

p longest_run_digit(10555223) == 5
