# inject

nums = [1, 2, 3, 4, 5]
nums.inject(0) do |accum, element| # accum is initially set to 0, the method argument
  accum + element
end

nums.inject(:+) # A cool shortcut that does the same as the above code.

# Write a method that takes nums and, using inject, returns the
# product of all of the elements.
def multiply_all(r)
    nums = r.to_a
    nums.inject(1) do |prod, mult|
        prod * mult
    end
end

puts "The product of the numbers within range #{(1..5)} = #{multiply_all((1..5))}"

# nums.inject(:*) works too ;)

# select

# Write a method that takes a range of the integers from 1 to 100
# and uses select to return an array of those that are perfect
# squares.


def perfect_squares_in_range_with_reject(r)
    nums = r.to_a

    nums.reject do |n|
        nums.first.upto(n) do |i|
            if n.to_f / i.to_f == i.to_f then
                n
                break
            end
        end
    end
end

def perfect_squares_in_range_with_select(r)
    nums = r.to_a
    flag = false

    nums.select do |n|
        nums.first.upto(n) do |i|
            if n.to_f / i.to_f == i.to_f then
                flag = true
                break
            end
        end
        if flag then
            flag = false
            n
        else
            next
        end
    end
end

puts "The suqares within range (1..100) are: #{perfect_squares_in_range_with_select((1..100))}"

# any?, all?, none?
nums = [2, 3, 5, 7]

# Using any?, verify that the range of integers from 1 to 5 does
# include at least one odd number
puts "#{nums} contains odd numbers => #{nums.any? { |i| i % 2 == 1 }}"
