def add (n1, n2)
    n1 + n2
end

def subtract (n1, n2)
    n1 - n2
end

def sum (nums)
    return 0 if nums.empty?

    s = 0
    nums.each do |num|
        s += num
    end

    s
end

def multiply (nums)
    if nums.index(0) == nil then m = 1
    else m = 0
    end

    nums.each do |num|
        m *= num
    end

    m
end

def factorial (n)
    return 1 if n == 0

    result = 1
    1.upto(n) do |num|
        result *= num
    end

    result
end

def power (n, exp)
    result = 1
    n.times do
        result = multiply([n, result])
    end

    result
end
