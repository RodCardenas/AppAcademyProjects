def reverser (&proc)

    s = proc.call
    words = s.split(" ")
    revWords = []

    words.each do |word|

        chars = word.split("")
        rev = []

        chars.each_with_index do |char, index|
            rev[index] = chars[chars.length - index - 1]
        end

        revWords << rev.join("")

    end

    return revWords.join(" ")
end

def adder (num = 0, &proc)
    return proc.call + 1 if num == 0
    return proc.call + num
end

def repeater (num = 0, &proc)
    return proc.call if num == 0
    num.times do proc.call end
end
