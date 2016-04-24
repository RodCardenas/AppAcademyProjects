# Rule 1: If a word begins with a vowel sound, add an "ay" sound to
# the end of the word.
#
# Rule 2: If a word begins with a consonant sound, move it to the end
# of the word, and then add an "ay" sound to the end of the word.

def translate(str)

    words = str.split(" ")

    translated_words = words.collect do |word|
        if ("aeiou").include?(word[0]) then
            word + "ay"
        elsif (word[0..1]).include?("qu") then
            word[2..-1] + word[0..1] + "ay"
        elsif (word[0..2]).include?("qu") then
            word[3..-1] + word[0..2] + "ay"
        else
            n = word.index(/[aeiou]/)
            word[n..-1] + word[0..n-1] + "ay"
        end
    end

    translated_words.join(" ")
end
