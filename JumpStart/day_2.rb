def vowels(str)
  chs = str.chars
  vowels = []

  chs.each do |ch|
    vowels << ch if "aeiou".include?(ch)
  end

  vowels
end

# p vowels("queso")

def odd_elems(arr)
  arr.each_with_index do |e , idx|
    puts e if idx % 2 == 1
  end
end

# odd_elems([1,2,3,4,5])

def zip_with_indices(arr)
  tuples = []
  arr.each_with_index do |e , idx|
    tuples << [e,idx]
  end

  tuples
end

# p zip_with_indices([0,2,3,4])

def odd_elems2(arr)
  arr.each_with_index do |e , idx|
    next if idx % 2 == 0
    puts e
  end
end

odd_elems2([1,2,3,4,5])

def first_n_primes(n)
  primes = []
  i = 2

  while true
    primes << i if is_prime?(i)
    i += 1
    break if primes.size == n
  end

  primes
end

def is_prime?(num)
  factors = []

  1.upto(num) do |n|
    if num % n == 0 then factors << n end
  end

  !(factors.size > 2)
end

p first_n_primes(10)
