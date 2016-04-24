# Added print and puts messages to see code in action step by step

text = %q{
Ruby is a great programming language. It is object oriented
and has many groovy features. Some people don't like it, but that's
not our problem! It's easy to learn. It's great. To learn more about Ruby,
visit the official Ruby Web site today.
}

puts "1." + text
puts "2." + text.gsub(/\s+/, ' ')
puts "3." + text.gsub(/\s+/, ' ').strip
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
print "4."
puts sentences
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
print "5."
puts sentences_sorted
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
print "6."
puts ideal_sentences.join(". ")
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
print "7."
puts ideal_sentences.join(". ")
