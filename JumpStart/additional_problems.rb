
# Write a method that takes an array of words and returns only the words that are
# anagrams of a given string.

def anagrams(str, arr)
end

#Tests
puts "\nAnagrams:\n" + "*" * 15 + "\n"
puts anagrams("cat", ["cat"]) == ["cat"]
words = ["cat", "act", "bat", "tac"]
puts anagrams("tca", words) == ["cat", "act", "tac"]
words = ["aaa", "aa", "a"]
puts anagrams("aa", words) == ["aa"]

# ************************************
# Write a boolean function that returns true if the vowels in a given word appear in order

def ordered_vowel_word?(word)
  vowels = ['a','e','i','o','u']
  last_vowel = "a"

  word.chars.each do |ch|
    if vowels.include?(ch)
      if ch < last_vowel
        return false
      else
        last_vowel = ch
      end
    end
  end

  true
end

#Tests
puts "\nOrdered Vowel Word:\n" + "*" * 15 + "\n"
puts ordered_vowel_word?("car") == true
puts ordered_vowel_word?("academy") == true
puts ordered_vowel_word?("programmer") == false
puts ordered_vowel_word?("grapefruit") == false

# ************************************
# Write a function that takes an array of words and returns the words whose vowels appear in order

def ordered_vowels(words)
  in_order = []
  words.each do |word|
    in_order << word if ordered_vowel_word?(word)
  end

  in_order
end

puts "\nOrdered Vowels:\n" + "*" * 15 + "\n"
puts ordered_vowels(["are"]) == ["are"]
puts ordered_vowels(["era", "are", "ear"]) == ["are"]
puts ordered_vowels(["hey", "wassup", "hello"]) == ["hey", "wassup", "hello"]
puts ordered_vowels(["firefox", "chrome", "safari", "netscape", "aeiou"]) == ["safari", "aeiou"]

# ************************************
# Write a function that takes two years and returns all the years within that range with no repeated digits.
# Hint: helper method?
# no_repeat_years(2010,2015) -> [2013,2014,2015]

def no_repeat_years(first_yr, last_yr)
  years = (first_yr .. last_yr)
  good_years = []

  years.each do |yr|
    good_years << yr if no_repeated_digits?(yr)
  end

  good_years
end

def no_repeated_digits?(num)
  digits = Hash.new(0)
  num.to_s.chars.each do |digit|
    digits[digit] += 1
  end

  digits.each do |digit,v|
    return false if v > 1
  end

  true
end

puts "\nNo Repeat Years:\n" + "*" * 15 + "\n"
puts no_repeat_years(1990, 2000) == []
puts no_repeat_years(1900,1902) == [1902]
puts no_repeat_years(2016, 2020) == [2016, 2017, 2018, 2019]


# ************************************ Write a method that takes a
# string of lower case words (no punctuation) and returns the letter
# that occurs most frequently. Use a hash within your method to keep
# track of the letter counts.  You will need to account for spaces.
# There are a few ways you can do this.

def most_frequent_letter(str)
  if str.include?(" ")
    words = str.split(" ")
    letters = []
    words.each do |word|
      word.chars.each do |ch|
        letters << ch
      end
    end
  else
    letters = str.split("")
  end

  letter_ct = Hash.new(0)

  letters.each do |letter|
    letter_ct[letter] += 1
  end

  most_frequent_letter_ct = nil
  most_frequent_letter = nil
  letter_ct.each do |letter, ct|
    if most_frequent_letter_ct.nil? || ct > most_frequent_letter_ct
      most_frequent_letter_ct = ct
      most_frequent_letter = letter
    end
  end

  most_frequent_letter
end

puts "\nMost Frequent Letter\n" + "*" * 15 + "\n"
puts most_frequent_letter("aaaaa") == "a"
puts most_frequent_letter("aaaaabbbbbb") == "b"
puts most_frequent_letter("we the people in order to form a more perfect union") == "e"


# ************************************ Write a method that takes a
# string of lower case words (no punctuation) and returns an array of
# letters that occur more than once.  We'll need to account for spaces,
# too.  Again, there are a few ways you can do this.

def non_unique_letters(str)
end

puts "\nNon-Unique Letters\n" + "*" * 15 + "\n"
puts non_unique_letters("abbbcdddde") == ["b", "d"]
puts non_unique_letters("abcde") == []
puts non_unique_letters("aabbccddee") == ["a", "b", "c", "d", "e"]
puts non_unique_letters("aaa bbb c d eee") == ["a", "b", "e"]

# ************************************ Write a method that takes a
# string of lower case words and returns an array of letters that do not
# occur in the string. This problem requires a different approach from
# the one we used in most_frequent_letter and we will need to show some
# care in how we set up the hash or process it to get the result.  Do
# you see why? We'll need to account for spaces, too.  Again, there are
# a few ways you can do this.

def missing_letters(str)

end

puts "\nMissing Letters\n" + "*" * 15 + "\n"
puts missing_letters("abcdefghijklmnopqrstuvwxyz") == []
puts missing_letters("abcdefghiklmnopqrstuvwxyz") == ["j"]
puts missing_letters("abcdefghiklmnopstuvwxyz") == ["j", "q", "r"]

#write a function primes that an arguement n and returns the first n primes

def primes(n)
end

puts "\nPrimes:\n" + "*" * 15 + "\n"
puts primes(0) == []
puts primes(1) == [2]
puts primes(2) == [2,3]
puts primes(6) == [2,3,5,7,11,13]

#write a boolean function zero_sum? that takes an array of intergers and returns
#true if 2 elements in the array sum to zero.

def zero_sum?(arr)
end

puts "\nZero Sum:\n" + "*" * 15 + "\n"
puts zero_sum?([1, -1]) == true
puts zero_sum?([1,1,0,2,1]) == false
puts zero_sum?([1,1,0,2,1,0]) == true
puts zero_sum?([2,3,4,-3,1]) == true

#write a function largest_sum_pair that takes an array of intergers and returns the
#2 unique indices whose elements sum to the largest number. Formatted [earlier_index, later_index]

def largest_sum_pair(array)
end

puts "\nLargest Sum Pair:\n" + "*" * 15 + "\n"
puts largest_sum_pair([1,2,3,4,5]) == [3,4]
puts largest_sum_pair([3,2,1,0,1,2,3]) == [0,6]
puts largest_sum_pair([-2,-1,-1,-2,-3]) == [1,2]
