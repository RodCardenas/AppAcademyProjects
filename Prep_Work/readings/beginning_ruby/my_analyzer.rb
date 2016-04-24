char_count = 0
char_count_wo_ws = 0
ln_count = 0
word_count = 0
sentence_count = 0
paragraph_count = 0
average_words_per_sent = 0
average_sent_per_par = 0
stopwords = %w{the a by on for of are with just but and to the my I has some in}

text = ""

File.open(ARGV[0]).each do |ln|
    ln_count += 1
    text << ln
end

char_count = text.length
text.scan(/\S/) {|ch| char_count_wo_ws +=1}
#text.scan(/\w+/) {|w| word_count +=1}
word_count = text.split.length
text.scan(/\./) {|sent| sentence_count +=1}
text.scan(/\?/) {|sent| sentence_count +=1}
text.scan(/\!/) {|sent| sentence_count +=1}
text.scan(/\n\n/) {|par| paragraph_count +=1}
average_words_per_sent = word_count/sentence_count
average_sent_per_par = sentence_count/paragraph_count

words = text.scan(/\w+/)
keywords = words.select { |word| !stopwords.include?(word) }

sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }

puts "#{char_count} characters"
puts "#{char_count_wo_ws} characters not counting whitespaces"
puts "#{ln_count} lines"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{average_words_per_sent} average words per sentence"
puts "#{average_sent_per_par} average sentences per paragraph"
puts "#{((keywords.length.to_f / words.length.to_f) * 100).to_i} is the percentage of non–stop words to all words"
puts "Summary:\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
