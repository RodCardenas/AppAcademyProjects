def hello_world
  puts "Hello World!"
end

def print_thrice(num)
  puts "#{num}" * 3
end

def print_thrice_thrice(num)
  3.times { print_thrice(num) }
end

# hello_world
# print_thrice(2)
# print_thrice_thrice(2)

def times_three_and_plus_five(num)
  puts "#{num * 3 + 5}"
end

def even_or_odd(num)
  num % 2 == 0 ? "Even" : "Odd"
end

def division_plus_remainder(big_num, small_num)
  puts "#{big_num/small_num + big_num % small_num}"
end

def is_factor_of?(big_num, small_num)
  big_num % small_num == 0
end

# times_three_and_plus_five(4)
# puts even_or_odd(2)
# puts even_or_odd(5)
# division_plus_remainder(7,2)
# puts is_factor_of?(10,2)

def print_up_to(num)
  i = 1

  while i <= num
    puts i
    i += 1
  end

  nil
end

def print_factors(num)
  factors = []
  1.upto(num) do |n|
    if is_factor_of?(num, n) then factors << n end
  end

  puts factors

  nil
end

# print_up_to(5)
# print_factors(100)

def largest_factor(num)
  (num - 1).downto(1) do |n|
    return n if is_factor_of?(num, n)
  end
end

def is_prime?(num)
  factors = []
  1.upto(num) do |n|
    if is_factor_of?(num, n) then factors << n end
  end

  !(factors.size > 2)
end

# puts largest_factor(100)
# puts is_prime?(27)
# puts is_prime?(29)
#
# i = 0
# begin
#   puts i unless i % 6 == 0
#   i += 1
# end until i == 20

def capitalize(str)
  str[0].upcase + str[1..-1]
end

def shout_then_whisper(str1, str2)
  "#{str1.upcase}!! ... #{str2.downcase}"
end

# puts capitalize("queso")
# puts shout_then_whisper("hello", "Rodrigo")

def first_n_evens(n)
  evens = []
  i = 0
  until evens.size == 3
    evens << i if i % 2 == 0
    i += 1
  end

  evens
end

def reverse(arr)
  i = 0
  rev = []

  while i < arr.size
    rev << arr.pop
  end

  arr = rev
end

# puts reverse([1, 2, 3, 4])

def rotate(arr, shift)
  if shift > 0
    shift.times do
      val = arr.pop
      arr.unshift(val)
    end

  elsif shift < 0
    shift.abs.times do
      val = arr.shift
      arr << val
    end
  end

  arr
end

# puts rotate([1, 2, 3, 4], 2)
# puts rotate([5, 6, 7], -1)

def all_uniqs(arr1, arr2)
  arr = []

  arr1.each do |e|
    arr << e unless arr2.include?(e)
  end

  arr2.each do |e|
    arr << e unless arr1.include?(e)
  end

  arr
end

# puts all_uniqs([2, 5, 7], [1, 2, 7])


### Cats 'n Hats ###
# You have 100 cats (You are quite lucky to own so many cats!).

# You have arranged all your cats in a line. Initially, none of your cats
# have any hats. You take 100 rounds walking around the cats, always starting
# at the beginning. Every time you stop at a cat, you put a hat on it if it
# doesn't have one, and you take its hat off if it has one on.

# The first round, you stop at every cat. The second round, you only stop at
# every 2nd cat (#2, #4, #6, #8, etc.). The third round, you only stop at
# every 3rd cat (#3, #6, #9, #12, etc.). You continue this process until the
# 100th round (i.e. you only visit the 100th cat).

# Write a program that prints which cats have hats at the end.

# email your solution to jeff@appacademy.io


def position_of_cats_with_hats
  cats = []

  i = 1

#Populate array with cats with no hats
  while i < 101
    cats[i] = false
    i += 1
  end

  i = 1
  step = 1
#Outside loop defines which cats we will visit
  while step <= 100
    i = 1
    #Inside loop assigns and/or removes hats
    while i < 100
      if cats[i] == false
        cats[i] = true
      else
        cats[i] = false
      end
      i += step
    end
    step += 1
  end

  cats_with_hats = []
  #Extracts which cats have hats
  cats.each_with_index do |cat, index|
    if cat == true
      cats_with_hats << index
    end
  end

  cats_with_hats
end

p position_of_cats_with_hats
