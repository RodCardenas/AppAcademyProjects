# def first_anagram?(string)
#   anagrams = []
#   s = string.dup.chars
#   start_time = Time.now
#
#   until anagrams.size == factorial(string.length)
#     candidate = s.shuffle.join("")
#     anagrams << candidate unless anagrams.include?(candidate)
#   end
#
#   end_time = Time.now
#
#   p end_time - start_time
#   anagrams.sort
# end
#
#
# def factorial(n)
#   return 1 if n == 1
#   n * factorial(n-1)
# end


# def first_anagram(string)
#   return [string, string.reverse] if string.length == 2
#   end_strings = first_anagram(string[1..-1])
#   strings = []
#   end_strings.each do |str|
#     strings << string[0..-3] + str
#   end
#   strings
# end

# O(n!)
def first_anagram(string1, string2)
  string1.chars.permutation.to_a.include? string2
end

#O(n^2)
def second_anagram(str1, str2)
  chars1 = str1.dup
  chars2 = str2.dup

  str1.each_char do |c|
    chars2.sub!(c,"") if chars2.include?(c)
  end

  str2.each_char do |c|
    chars1.sub!(c,"") if chars1.include?(c)
  end

  return true if chars1.empty? && chars2.empty?
  false
end

#O(n^2)
def third_anagram(str1, str2)
  str1.sort == str2.sort
end

#O(n)
def fourth_anagram(str1, str2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)

  str1.chars.each do |c|
    h1[c] += 1
  end

  str2.chars.each do |c|
    h2[c] += 1
  end

  h1 == h2
end
