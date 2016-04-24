require 'benchmark'

def lcs(array)
  return 0 if array.size == 0
  return array.first if array.size == 1

  mid = array.size / 2
  middle = array[mid]

  left = lcs array.take(mid)
  right = lcs array.drop(mid+1)

  [
    left,
    middle,
    right,
    left+middle,
    right+middle,
    left+middle+right
  ].max
end


p Benchmark.measure { lcs((1..50000).to_a) }

p Benchmark.measure { lcs((1..500000).to_a) }

p Benchmark.measure { lcs((1..5000000).to_a) }

p Benchmark.measure { lcs((1..50000000).to_a) }


#<Benchmark::Tms:0x007f96548b66f8 @label="", @utime=0.0> 100
#<Benchmark::Tms:0x007f96548df3a0 @label="", @utime=0.0> 1,000
#<Benchmark::Tms:0x007f9652b71bb0 @label="", @utime=0.0> 10,000
#<Benchmark::Tms:0x007f9652b221a0 @label="", @utime=0.07> 100,000
#<Benchmark::Tms:0x007f9652aab640 @label="", @utime=0.54> 1,000,000
#<Benchmark::Tms:0x007f9652a40070 @label="", @utime=5.95> 10,000,000
#<Benchmark::Tms:0x007f9652adb250 @label="", @utime=66.56> > 100,000,000

#<Benchmark::Tms:0x007ff101231b90 @label="", @utime=0.04> 50000
#<Benchmark::Tms:0x007ff1014ec768 @label="", @utime=0.28> 500000
#<Benchmark::Tms:0x007ff1014eca88 @label="", @utime=2.95> 5000000
#<Benchmark::Tms:0x007ff1013bd298 @label="", @utime=32.76> 50000000
