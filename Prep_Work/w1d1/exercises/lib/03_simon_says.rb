def echo(str)
    str
end

def shout(str)
    str.upcase
end

def repeat(str, rtimes = 2)
    str = str + " "
    "#{str * rtimes}".chop
end

def start_of_word(str, qty)
    str[0, qty]
end

def first_word (str)
    str.scan(/\w+/)[0]
end

def titleize (str)
    little_words = ["and", "the", "over"]

    words = str.scan(/\w+/)

    titlelized_array = words.collect do |word|
        if little_words.include?(word) then
            word
        else
            word.capitalize
        end
    end

    titlelized_array[0] = titlelized_array[0].capitalize

    titlelized_array.join(" ")
end
